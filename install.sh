#!/bin/sh

if [ $(uname) = "Darwin" ]; then
  dest_dir="$HOME/Library/Application Support/Übersicht/widgets/ubersicht.widget"
  mkdir -p $(dirname $dest_dir)

  if [ -d "$dest_dir" ]; then
    rm -rf "$dest_dir"
  fi

  ln -sf "${PWD}" "$dest_dir"
fi
