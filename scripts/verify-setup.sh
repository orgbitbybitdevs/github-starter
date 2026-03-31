#!/bin/bash

echo "Checking Git configuration..."

git config user.name && echo "Name OK" || echo "Name missing"
git config user.email && echo "Email OK" || echo "Email missing"

if [ -f ~/.ssh/id_ed25519 ]; then
  echo "SSH key exists"
else
  echo "SSH key missing"
fi
