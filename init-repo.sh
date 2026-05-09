#!/bin/bash

# Exit on error
set -e

# This script must be run from the root of the Delivery-Failure-Triage directory

# 1. init: initial project scaffold
# We'll create a dummy file to start the history
echo "initial scaffold" > init.txt
git init
git add .
git commit -m "init: initial project scaffold with Express and MongoDB"
rm init.txt

# 2. feat: add signup and login routes
# We simulate adding these routes
git add server/models/User.js server/routes/auth.js
git commit -m "feat: add signup and login routes with JWT"

# 3. feat: add user profile route
git add server/middleware/auth.js server/routes/users.js
git commit -m "feat: add user profile route with auth middleware"

# 4. ci: add GitHub Actions workflow for deployment
# Failures 3 and 4 are introduced here
git add .github/workflows/deploy.yml
git commit -m "ci: add GitHub Actions workflow for deployment"

# 5. refactor: rename backend directory to server
# FAILURE 2: Introduced here (historically)
git add server/
git commit -m "refactor: rename backend directory to server for clarity"

# 6. fix: update workflow to new CI runner format
# FAILURE 1: Wrong branch name introduced here
git add .github/workflows/deploy.yml
git commit -m "fix: update workflow to new CI runner format"

# 7. feat: add health check endpoint
git add server/index.js server/config/db.js
git commit -m "feat: add health check endpoint"

# 8. chore: update environment variable documentation
git add README.md .env.example .gitignore package.json Changes.md client/package.json
git commit -m "chore: update environment variable documentation"

# Rename branch to main if it's master (to make Failure 1 work)
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    git branch -M main
fi

echo "--------------------------------------------------------"
echo "Repository initialized with 8 commits and 4 hidden failures."
echo "Branch is set to 'main', but workflow triggers on 'master'."
echo "--------------------------------------------------------"
