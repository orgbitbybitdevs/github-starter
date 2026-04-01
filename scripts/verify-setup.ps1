param(
    [ValidateSet("auth", "full")]
    [string]$Stage = "full",
    [switch]$CheckGitHub
)

$ErrorActionPreference = "Stop"

$passCount = 0
$warnCount = 0
$failCount = 0

function Pass([string]$Message) {
    $script:passCount++
    Write-Host "[PASS] $Message"
}

function Warn([string]$Message) {
    $script:warnCount++
    Write-Host "[WARN] $Message"
}

function Fail([string]$Message) {
    $script:failCount++
    Write-Host "[FAIL] $Message"
}

function Section([string]$Title) {
    Write-Host ""
    Write-Host "== $Title =="
}

function Write-Summary {
    Section "Summary"
    Write-Host "Passed: $passCount"
    Write-Host "Warnings: $warnCount"
    Write-Host "Failed: $failCount"
}

function Get-VersionParts([string]$RawVersion) {
    if ($RawVersion -match '([0-9]+)\.([0-9]+)\.([0-9]+)') {
        return @([int]$Matches[1], [int]$Matches[2], [int]$Matches[3])
    }

    return @(0, 0, 0)
}

function Test-VersionGe([string]$Actual, [string]$Minimum) {
    $actualParts = Get-VersionParts $Actual
    $minimumParts = Get-VersionParts $Minimum

    for ($i = 0; $i -lt 3; $i++) {
        if ($actualParts[$i] -gt $minimumParts[$i]) {
            return $true
        }

        if ($actualParts[$i] -lt $minimumParts[$i]) {
            return $false
        }
    }

    return $true
}

function Expand-PathString([string]$RawPath) {
    if ([string]::IsNullOrWhiteSpace($RawPath)) {
        return $RawPath
    }

    if ($RawPath.StartsWith("~/") -or $RawPath.StartsWith("~\")) {
        $relative = $RawPath.Substring(2).Replace("/", [IO.Path]::DirectorySeparatorChar).Replace("\", [IO.Path]::DirectorySeparatorChar)
        return Join-Path $HOME $relative
    }

    if ($RawPath -match '^/([a-zA-Z])/(.*)$') {
        $drive = $Matches[1].ToUpperInvariant()
        $relative = $Matches[2] -replace '/', '\'
        return "${drive}:\$relative"
    }

    return [Environment]::ExpandEnvironmentVariables($RawPath)
}

Section "Git installation"
$gitCommand = Get-Command git -ErrorAction SilentlyContinue
if ($null -ne $gitCommand) {
    $gitVersionRaw = (& git --version).Split()[-1]
    Pass "Git is installed ($gitVersionRaw)."

    if (Test-VersionGe $gitVersionRaw "2.34.0") {
        Pass "Git version supports SSH commit signing."
    }
    else {
        Fail "Git 2.34.0 or newer is required for SSH commit signing."
    }
}
else {
    Fail "Git is not installed or not available on PATH."
    Write-Summary
    exit 1
}

Section "Global Git configuration"
$defaultBranch = (& git config --global --get init.defaultBranch 2>$null)
if ($defaultBranch -eq "main") {
    Pass "Default branch is configured as 'main'."
}
else {
    Fail "Set the default branch with: git config --global init.defaultBranch main"
}

$userName = (& git config --global --get user.name 2>$null)
if (-not [string]::IsNullOrWhiteSpace($userName)) {
    Pass "Global user.name is set to '$userName'."
}
else {
    Fail 'Set your name with: git config --global user.name "Your Name"'
}

$userEmail = (& git config --global --get user.email 2>$null)
if (-not [string]::IsNullOrWhiteSpace($userEmail)) {
    Pass "Global user.email is set to '$userEmail'."
}
else {
    Fail 'Set your email with: git config --global user.email "you@example.com"'
}

$defaultPublicKeyPath = Join-Path $HOME ".ssh/id_ed25519.pub"
$defaultPrivateKeyPath = Join-Path $HOME ".ssh/id_ed25519"
$keyPublicCheck = $defaultPublicKeyPath
$keyPrivateCheck = $defaultPrivateKeyPath

Section "Commit signing"
if ($Stage -eq "full") {
    $gpgFormat = (& git config --global --get gpg.format 2>$null)
    if ($gpgFormat -eq "ssh") {
        Pass "Git is configured to use SSH signatures."
    }
    else {
        Fail "Set SSH signing format with: git config --global gpg.format ssh"
    }

    $signingKeyRaw = (& git config --global --get user.signingkey 2>$null)
    if (-not [string]::IsNullOrWhiteSpace($signingKeyRaw)) {
        $signingKeyPath = Expand-PathString $signingKeyRaw
        if (Test-Path $signingKeyPath) {
            Pass "Configured signing key exists at '$signingKeyRaw'."
            $keyPublicCheck = $signingKeyPath
            $keyPrivateCheck = if ($signingKeyPath.EndsWith(".pub")) {
                $signingKeyPath.Substring(0, $signingKeyPath.Length - 4)
            }
            else {
                $signingKeyPath
            }
        }
        else {
            Fail "Configured signing key does not exist at '$signingKeyRaw'."
        }
    }
    else {
        Fail "Set your signing key with: git config --global user.signingkey ~/.ssh/id_ed25519.pub"
    }

    $commitSign = (& git config --global --get commit.gpgsign 2>$null)
    if ($commitSign -eq "true") {
        Pass "Automatic commit signing is enabled."
    }
    else {
        Fail "Enable automatic signing with: git config --global commit.gpgsign true"
    }
}
else {
    Warn "Skipping signing checks for the authentication stage. Run the full check after module 05."
}

Section "SSH key material"
if ((Test-Path $keyPrivateCheck) -and (Test-Path $keyPublicCheck)) {
    Pass "SSH key pair exists."
}
else {
    Fail "Could not find both the private key and public key."
}

$sshAddCommand = Get-Command ssh-add -ErrorAction SilentlyContinue
if ($null -eq $sshAddCommand) {
    Warn "ssh-add is not available on PATH."
}
else {
    $agentOutput = (& ssh-add -l 2>&1 | Out-String).Trim()
    if ($agentOutput -match "The agent has no identities|no identities") {
        Warn "ssh-agent is running but no keys are loaded. Run: ssh-add ~/.ssh/id_ed25519"
    }
    elseif ($agentOutput -match "Could not open a connection|Error connecting to agent") {
        Warn "ssh-agent is not running in this shell. Start the OpenSSH Authentication Agent or start a new agent session."
    }
    elseif ($LASTEXITCODE -eq 0) {
        Pass "ssh-agent is responding and has at least one identity loaded."
    }
    else {
        Warn "ssh-add returned an unexpected result."
        if (-not [string]::IsNullOrWhiteSpace($agentOutput)) {
            Write-Host $agentOutput
        }
    }
}

Section "Repository remote"
$insideWorkTree = (& git rev-parse --is-inside-work-tree 2>$null)
if ($insideWorkTree -eq "true") {
    $originUrl = (& git remote get-url origin 2>$null)
    if ([string]::IsNullOrWhiteSpace($originUrl)) {
        Warn "No 'origin' remote is configured in this repository."
    }
    elseif ($originUrl -match '^git@github\.com:') {
        Pass "Origin remote uses SSH: $originUrl"
        Write-Host "      In this course, origin should usually point to your own template copy."
    }
    else {
        Warn "Origin remote is not using SSH: $originUrl"
    }
}
else {
    Warn "This directory is not a Git repository, so remote checks were skipped."
}

Section "Live GitHub authentication"
if ($CheckGitHub) {
    $sshCommand = Get-Command ssh -ErrorAction SilentlyContinue
    if ($null -eq $sshCommand) {
        Warn "ssh is not available on PATH."
    }
    else {
        $sshOutput = (& ssh -T -o BatchMode=yes -o StrictHostKeyChecking=accept-new git@github.com 2>&1 | Out-String).Trim()
        if ($sshOutput -match "successfully authenticated") {
            Pass "GitHub SSH authentication succeeded."
        }
        else {
            Warn "GitHub SSH authentication could not be confirmed automatically."
            if (-not [string]::IsNullOrWhiteSpace($sshOutput)) {
                Write-Host $sshOutput
            }
        }
    }
}
else {
    Warn "Skipping live GitHub SSH test. Run 'powershell -ExecutionPolicy Bypass -File scripts/run-auth-check.ps1' to test authentication automatically."
}

Write-Summary

if ($failCount -gt 0) {
    exit 1
}
