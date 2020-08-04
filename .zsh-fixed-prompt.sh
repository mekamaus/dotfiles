#!/bin/zsh

# Fixed Prompt

# This will keep the prompt at the bottom of the screen at all times, while
# output scrolls up from it. Since the prompt is always in the same position,
# you won't have to move your eyes around the screen as much.

# TODO(samwise):
# - make less/man pages work
# - clear empty blank lines at start of tmux history
# - run preexec before executing commands entered in fc (esc+v)
# - preserve output and prompt position when resizing pane

# Must be at least 2
#PROMPT_HEIGHT=2

#CLEAR_OUTPUT=false
EMPTY_CLEARS_OUTPUT=true
#SHOW_COMMAND=true

PROMPT_PADDING_BOTTOM=1

__cmd=false

preexec() {
  # indicate that a command was entered
  __cmd=true
}

precmd() {
  # clear output if enter was pressed with no command
  if [[ "$__cmd" != true ]] && [[ "$EMPTY_CLEARS_OUTPUT" = true ]]; then
    tput reset
    [[ "$TERM" = screen* ]] && [ -n "$TMUX" ] && tmux clear-history
    tput cup $((LINES-3))
  fi
  __cmd=false
}

tput cup $((LINES-2))

