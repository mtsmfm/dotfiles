# dotfiles

## requirements

### docker, docker-compose

https://docs.docker.com/engine/installation/#supported-platforms

### dein.vim

      curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
      sh ./installer.sh ~/.vim/bundles

### rcm

https://github.com/thoughtbot/rcm#installation

## installation

      git clone https://github.com/mtsmfm/dotfiles
      cd dotfiles
      RCRC=$(pwd)/rcrc rcup -d $(pwd)
