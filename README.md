# dotvim
My NeoVim Configuration. Requires NeoVim >= 0.1.1

## Requirements
* neovim
* neovim python modules: `pip install neovim`
* ctags

## Usage

Clear out your old nvim config
```shell
rm -rf ~/.config/nvim
```

Clone repo and create tmp dir
```shell
mkdir -p ~/.config
git clone git@github.com:cornet/dotvim.git ~/.config/nvim
mkdir ~/.vimtmp
```

Fire up `nvim` (ignore any warnings/errors) then run
```
:PlugInstall
```

Restart vim and enjoy the shiny.

## Puppet ctags support

Add the following to `~/.ctags`

```shell
--langdef=puppet
--langmap=puppet:.pp
--regex-puppet=/^class[ \t]*([:a-zA-Z0-9_\-]+)[ \t]*/\1/c,class/
--regex-puppet=/^site[ \t]*([a-zA-Z0-9_\-]+)[ \t]*/\1/s,site/
--regex-puppet=/^node[ \t]*([a-zA-Z0-9_\-]+)[ \t]*/\1/n,node/
--regex-puppet=/^define[ \t]*([:a-zA-Z0-9_\-]+)[ \t]*/\1/d,definition/
```
