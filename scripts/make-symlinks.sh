#!/bin/bash

dir="$(pwd)"
olddir=$dir/dotfiles_old

files="
  .gitconfig
  .config/starship.toml
  .config/nvim
  .gh-completion.sh
  .zshrc
"

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $files; do
  mv ~/$file $olddir
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/$file
done