#!/bin/sh

if [ -e ~/.vimrc -o -e ~/.vim ]; then
	echo "경고: 설치를 진행하려면 ~/.vim/ 디렉토리와 ~/.vimrc 파일을 삭제해야 합니다."
	exit
fi

ln -s ~/vimconfig/vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vi -c :BundleInstall -c :qa!

