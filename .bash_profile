workspace=dev
tmux has-session -t $workspace
[ $? != 0 ] && tmux new-session -s $workspace
[ "$TERM" != "screen" ] || [ -z "$TMUX" ] && tmux attach -t $workspace

export PATH=$PATH:$HOME/Library/Python/3.7/bin
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. ~/Library/Python/3.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

alias e="vim"

set -o vi

tmux_clear() {
  tput reset
  [ "$TERM" = "screen" ] && [ -n "$TMUX" ] && tmux clear-history
}

# preexec, precmd hooks

[ -f ~/.bash-preexec.sh ] || curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh
source ~/.bash-preexec.sh

preexec() {
  tmux_clear # clear screen before command output
  __cmd=true
}
precmd() {
  [ "$__cmd" = true ] || tmux_clear # clear screen if enter was pressed with no command
  __cmd=false
}

