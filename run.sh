#!/usr/bin/env bash

### BEGIN ###
# Author: idevz
# Since: 10:47:26 2019/04/09
# Description:       deploy iresty.com
# deploy          ./run.sh
#
# Environment variables that control this script:
#
### END ###

set -e

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd docs
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ $# -eq 1 ]; then
    msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
