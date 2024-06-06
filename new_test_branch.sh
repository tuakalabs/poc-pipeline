#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <new_branch>"
    exit 1
fi

branch_name=$1
git checkout -b "$branch_name"
file_name=$(echo "$branch_name" | tr '/' '_')
echo "$branch_name" > "${file_name}.txt"
git add "${file_name}.txt"
git commit -m "${branch_name} commit"
git push origin "$branch_name"
echo "Branch '$branch_name' created, committed, and pushed successfully."
