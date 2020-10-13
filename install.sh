#!/bin/zsh

# config
gh="https://github.com"
gh_raw="https://raw.github.com"

zsh_custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
zsh_themes="$zsh_custom/themes"
zsh_plugins="$zsh_custom/plugins"
omz_install="$gh_raw/ohmyzsh/ohmyzsh/master/tools/install.sh"

vundle_git="$gh/VundleVim/Vundle.vim.git"
vundle_dest="$HOME/.vim/bundle/Vundle.vim"

base_dir="$(dirname "$0")"

zsh_theme() {
  local git="$gh/$1"
  local dest="$zsh_themes/${1##*/}"
  [[ -d $dest ]] || git clone --depth=1 "$git" "$dest"
}

zsh_plugin() {
  local git="$gh/$1"
  local dest="$zsh_plugins/${1##*/}"
  [[ -d $dest ]] || git clone "$git" "$dest"
}

copy_home() {
  cp -f "$base_dir/$1" "$HOME/$1"
}

# install oh-my-zsh
[[ -d $HOME/.oh-my-zsh ]] || sh -c "$(curl -fsSL "$omz_install")"

# zsh themes
zsh_theme 'romkatv/powerlevel10k'

# zsh plugins
zsh_plugin 'zsh-users/zsh-autosuggestions'
zsh_plugin 'zsh-users/zsh-syntax-highlighting'

# vundle
[[ -d "$vundle_dest" ]] || git clone "$vundle_git" "$vundle_dest"

# symlinks
copy_home .inputrc
copy_home .p10k.zsh
copy_home .tmux.conf
copy_home .tmux.conf.local
copy_home .vimrc
copy_home .zshrc

# vim setup
vim +PluginInstall +qall

# YouCompleteMe setup
~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

# Install zplug
zplug_installer="https://raw.githubusercontent.com/zplug/installer/master/installer.zsh"
curl -sL --proto-redir -all,https $zplug_installer | zsh

