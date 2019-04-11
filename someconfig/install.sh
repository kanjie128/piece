#!/bin/bash

#vim config
cp ./vimrc ~/.vimrc

#config .vim
tar zxvf vim.tgz
cp ./.vim ~/.vim -R
rm ./.vim -rf

#install ctags
tar zxvf ctags-5.8.tgz
cd ctags-5.8
./configure && make && make install
cd -
rm ctags-5.8 -rf

#taglist config
cp ./ctags.cnf ~/.ctags

#install go tools
#export http_proxy
#export https_proxy
go get -u github.com/zmb3/gogetdoc
go get -u golang.org/x/tools/cmd/guru
go get -u github.com/golang/lint/golint
go get -u github.com/davidrjenni/reftools/cmd/fillstruct
go get -u github.com/rogpeppe/godef
go get -u github.com/fatih/motion
go get -u github.com/kisielk/errcheck
go get -u github.com/derekparker/delve/cmd/dlv
#go get -u github.com/nsf/gocode
go get -u github.com/stamblerre/gocode #support go mod
go get -u github.com/jstemmer/gotags
go get golang.org/x/tools/cmd/goimports


