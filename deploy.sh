#!/usr/bin/env bash
# Requires GitHub CLI (https://cli.github.com) and `gh auth login`
set -e
git init -b main
git add .
git commit -m "Initial commit: Kav 66 radio"
gh repo create kav66 --public --source=. --push
gh api -X POST repos/{owner}/kav66/pages -f build_type=workflow || true
echo "Live soon at: https://$(gh api user -q .login).github.io/kav66/"
