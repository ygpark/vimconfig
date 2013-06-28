#!/bin/sh

if [ -e ~/.vimrc -o -e ~/.vim ]; then
	echo "TODO:"
	echo "rm -rf ~/.vim"
	echo "rm -f ~/.vimrc"
	exit
fi

ln -s ~/vimconfig/vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vi -c :BundleInstall

