#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

# link all dot files
find . -type f -iname ".*" | xargs realpath | xargs -I {} ln -svf {} ~

# rsync all dot folders
rsync -avh --no-perms \
  --exclude='.git' \
  --exclude='README.md' \
  --exclude='.gitignore' \
  --include='*/' \
  --exclude='/*' \
  . ~
