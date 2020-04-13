#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No directory name supplied"
    echo "Usage: bash initialize_app.sh dirname"
    exit -1
fi

# Recreate folder
rm -rf ../$1
mkdir ../$1

# Copy everything from current directory except node_modules (in case it is installed)
shopt -s extglob
cp -a !(node_modules) ../$1

# Remove install scripts
rm -f ../$1/initialize_app.sh
rm -f ../$1/initialize_app.ps1

# Initialize a git repository and create a first commit
cd ../$1
git init
git add .
git commit -m "Initial commit"
