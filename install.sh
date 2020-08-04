#!/bin/zsh

gh="https://github.com"
gh_raw="https://raw.github.com"

# zsh themes, plugins
zsh_custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
zsh_themes="$zsh_custom/themes"
zsh_plugins="$zsh_custom/plugins"
omz_install="$gh_raw/ohmyzsh/ohmyzsh/master/tools/install.sh"
p10k_git="$gh/romkatv/powerlevel10k.git"
p10k_dest="$zsh_themes/powerlevel10k"
zsh_autosuggestions_git="$gh/zsh-users/zsh-autosuggestions"
zsh_autosuggestions_dest="$zsh_plugins/zsh_autosuggestions"
zsh_sh_git="$gh/zsh-users/zsh-syntax-highlighting.git"
zsh_sh_dest="$zsh_plugins/zsh-syntax-highlighting"

sh -c "$(curl -fsSL "$omz_install")"
git clone --depth=1 "$p10k_git" "$p10k_dest"
git clone "$zsh_autosuggestions_git" "$zsh_autosuggestions_dest"
git clone "$zsh_sh_git" "$zsh_sh_dest"

