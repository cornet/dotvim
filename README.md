# dotvim
My NeoVim Configuration

## Requirements
* neovim
* neovim python modules `pip install neovim`
* ag ```apt-get install silversearcher-ag``` or ```brew install ag```

## Usage

Clear out your old vim config
```shell
cd ~ && rm -rf .vim .vimrc
```

Clone and move everything into the right places
```shell
git clone git@github.com:cornet/dotvim.git
mkdir -p ~/.config/
mv dotvim ~/.config/nvim
mkdir ~/.vimtmp
```

Fire up `nvim` (ignore any warnings/errors) then run
```
:PlugInstall
```

Restart vim and enjoy the shiny.
