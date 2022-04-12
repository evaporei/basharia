#!/usr/bin/env bash

set -e

# Usage:
# ./git/new_repo.sh $REPO_NAME

REPO_NAME=$1

# 1. Creates $REPO_NAME folder
mkdir $REPO_NAME

# 2. Change directory
cd $REPO_NAME

# 3. Initialize git
git init

# 4. Create README.md with $REPO_NAME header
echo "# $REPO_NAME" > README.md

# 5. Add README.md file and create the first commit
git add README.md
git commit -m "initial commit"

# 6. Get Github username
EMAIL=$(git config --get user.email)
USERNAME=$(curl -s "https://api.github.com/search/users?q=$EMAIL" | jq '.items[0].login' | tr -d '"')

# 7. Set remote SSH URL
git remote add origin git@github.com:$USERNAME/$REPO_NAME.git

# 8. Check if Github CLI is installed
if ! command -v gh &> /dev/null; then
  echo "Github CLI 'gh' not found, exit successfully without creating repository to Github"
  exit 0
fi

REPO_VISIBILITY=$2
REPO_VISIBILITY="${REPO_VISIBILITY:---private}"

# 9. Create repository on Github as well
gh repo create $REPO_NAME $REPO_VISIBILITY

# 10. Push local git repository with initial commit containing README.md
git push --set-upstream origin main
