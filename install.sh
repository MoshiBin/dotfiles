#!/bin/bash

TOP=$(dirname "$(readlink -f "$0")")

function die() {
    echo "$0: $*"
    exit 1
}

function _install_link() {
    local filename="$1"
    if [[ -z "$filename" ]]; then
        die "_install_link: No arguments given"
    fi
    local target_link="$2"
    if [[ -z "$target_link" ]]; then
        target_link=".$filename"
    fi
    target_link_path=$HOME/$target_link
    filename="$TOP/$filename"
    if [[ ! -e "$filename" ]]; then
        die "_install_link: $filename does not exist"
    fi
    
    if [[ -e "$target_link_path" ]]; then
        if [[ "$(readlink -f "$target_link_path")" == "$filename" ]]; then
            # already installed; skip
            return
        fi
        read -p "Target $target_link_path already exists. Overwrite? (Y/n) " -n 1 -r
        echo
        if [[ ! "$REPLY" =~ ^[Yy]$ ]]; then
            return
        fi
        if [[ -d "$target_link_path" ]]; then
            mv "$target_link_path" "$target_link_path.bak"
        fi
        echo "Backed up to $filename.bak"
    fi
    ln -sf "$filename" "$target_link_path"
}

for target in bashrc vimrc tmux.conf bashrc.d tmux vim screenrc; do
    _install_link "$target"
done
