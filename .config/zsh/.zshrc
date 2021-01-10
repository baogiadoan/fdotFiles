#!/usr/bin/env zsh

# Luke's config for the Zoomer Shell

# # The following lines were added by compinstall
# zstyle :compinstall filename '/home/cole/.zshrc'
# 
# autoload -Uz compinit
# compinit
# # End of lines added by compinstall

source "/home/cole/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

# ZSH_THEME="random"
ZSH_THEME=""

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}cole%{$fg[green]%}@%{$fg[blue]%}pc %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# Add fpath
fpath+=$HOME/.config/zsh/pure

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc"

# cd if not command
setopt AUTO_CD

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# SPACESHIP_PROMPT_ADD_NEWLINE="false"

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  exec_time     # Execution time
  line_sep      # Line break
  char          # Prompt character
)

# Disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Enable command auto-correction
# ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"



# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
# bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# quick open calculator
bindkey -s '^a' 'eva -l\n'

# fuzzy search
# bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

bindkey \^K kill-line

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  # zsh-cwd-history
  vi-mode
  fzf
)

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^ ' autosuggest-execute


export FZF_BASE=/usr/bin/fzf
# export FZF_BASE=/home/gautierk/.fzf
export FZF_DEFAULT_COMMAND='rg --files --silent'
export FZF_CTRL_T_COMMAND='rg --files 2> /dev/null'
export FZF_DEFAULT_OPTS='--height 40%'
export FZF_CTRL_T_OPTS='--height 40%'


ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
	mkdir  $ZSH_CACHE_DIR
fi

source "$ZSH/oh-my-zsh.sh"

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/gautierk/google-cloud-sdk/path.zsh.inc' ]; then . '/home/gautierk/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/gautierk/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/gautierk/google-cloud-sdk/completion.zsh.inc'; fi

stty -ixon

unset zle_bracketed_paste

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
