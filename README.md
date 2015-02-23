# dotvim
My Vim Configuration

## Requirements
* vim built with python extensions
* ag ```apt-get install silversearcher-ag``` or ```brew install ag```

## Usage

Clear out your old vim config
```shell
cd ~ && rm -rf .vim .vimrc
```

Clone and move everything into the right places
```shell
git clone git@github.com:cornet/dotvim.git
mv dotvim .vim
ln -s ~/.vim/vimrc ~/.vimrc
mkdir ~/.vimtmp
```

Fire up vim (ignore any warnings/errors) then run
```
:PlugInstall
```

Restart vim and enjoy the shiny.
