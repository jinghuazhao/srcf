#!/bin/bash

# Set this to your repo name
REPO_NAME="srcf"

# GitHub remote URL (SSH or HTTPS)
GIT_REMOTE="git@github.com:jinghuazhao/$REPO_NAME.git"

# Initialize Git if not already
if [ ! -d .git ]; then
  echo "Initializing git repository..."
  git init
  git remote add origin "$GIT_REMOTE"
fi

# File list — including this script itself
FILES=(
  "name.jpg"
  "cv.pdf"
  "index.html"
  "header.html"
  "about.html"
  "work.html"
  "contact.html"
  "colleagues.html"
  "reproducible.html"
  "style.css"
  "references.txt"
  "r-genetics.htm"
  "template.html"
  "upload-to-github.sh"   # ✅ Include this script
  "iop"
  "ucl"
  "mrc"
  "focus.gif"
  "ucllinks.htm"
  "kcllinks.htm"
  "mrclinks.htm"
  "phpclinks.html"
  "suggests.html"
)

# Add and commit each file individually
for file in "${FILES[@]}"; do
  if [ -f "$file" ] || [ -d "$file" ]; then
    echo "Adding and committing $file..."
    git add "$file"
    git commit -m "Add/Update $file"
  else
    echo "Warning: $file not found!"
  fi
done

# Push to main branch
echo "Pushing to GitHub..."
git branch -M main
git push -u origin main
