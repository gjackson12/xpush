#!/bin/sh

# Set variables for script
CODECOMMIT_REPO="Angular"
BRANCH="master"
ORIGIN="codecommit"

echo "Pushing clone of repo to CodeCommit, bon voyage!"

git push codecommit --mirror
