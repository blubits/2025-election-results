#!/bin/bash

# Change to the repository root directory
cd "$(git rev-parse --show-toplevel)/data/raw/2025" || exit 1

# Get current datetime in the desired format
DATETIME=$(date "+%Y-%m-%d %H:%M:%S")

# Stage all changes
git add .

# Check if there are changes to commit
if git diff --cached --quiet; then
  echo "No changes to commit at $DATETIME"
  exit 0
fi

# Commit with timestamp
git commit -m "update as of $DATETIME"

echo "Committed changes at $DATETIME"
