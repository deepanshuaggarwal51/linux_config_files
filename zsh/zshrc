# ~/.zshrc file for zsh non-login shells.

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt EXTENDED_HISTORY          # save timestamp and duration in history
setopt HIST_EXPIRE_DUPS_FIRST    # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_IGNORE_ALL_DUPS      # remove older duplicate when a new duplicate is added
setopt HIST_IGNORE_SPACE         # ignore commands that start with space
setopt HIST_VERIFY               # show command with history expansion before running it
setopt INC_APPEND_HISTORY_TIME   # append with accurate wall-clock time after command completes
setopt HIST_FCNTL_LOCK           # use file locking for safe concurrent history writes

# Navigation
setopt AUTO_CD               # type a directory name to cd into it
setopt AUTO_PUSHD            # cd pushes to directory stack automatically
setopt PUSHD_IGNORE_DUPS     # no duplicate entries in directory stack
setopt CDABLE_VARS           # cd into variables that hold paths

# Globbing & Patterns
setopt EXTENDED_GLOB         # advanced patterns like ^file, **/*.txt
setopt GLOB_DOTS             # include dotfiles in glob matches
setopt NULL_GLOB             # no error if glob matches nothing
setopt NUMERICGLOBSORT       # sort filenames numerically when it makes sense

# Completion
setopt MENU_COMPLETE         # auto-select first completion match
setopt COMPLETE_IN_WORD      # complete from both ends of a word
setopt ALWAYS_TO_END         # move cursor to end after completion

# Miscellaneous
setopt RCEXPANDPARAM         # array expansion with parameters
setopt NOCHECKJOBS           # don't warn about running processes when exiting
setopt PIPE_FAIL             # return error if any command in pipe fails
setopt NOBEEP                # no beep

# Use modern completion system (regenerate dump only once per day for faster startup)
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' verbose true
zstyle ':completion:*' rehash true             # auto-find new executables
zstyle ':completion:*' use-cache on            # cache completion results
zstyle ':completion:*' cache-path ~/.zsh/cache

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Prompt
autoload -Uz promptinit
promptinit
prompt fire

# make less friendlier for non-text files (archives, PDFs, images, etc.)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls, less and man, and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
    [[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# load additional aliases from ~/.bash_aliases if it exists
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

# enable auto-suggestions based on the history
if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
fi

# enable syntax-highlighting
[[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] &&
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# add ~/.local/bin to path
[[ -d "$HOME/.local/bin" ]] && export PATH="$PATH:$HOME/.local/bin"

# extract any archive type
xtract() {
  case "$1" in
    *.tar.gz)  tar -xzf "$1"  ;;
    *.tar.bz2) tar -xjf "$1"  ;;
    *.tar.xz)  tar -xJf "$1"  ;;
    *.zip)     unzip "$1"     ;;
    *.gz)      gunzip "$1"    ;;
    *.rar)     unrar x "$1"   ;;
    *.7z)      7z x "$1"      ;;
    *)         echo "Unknown format: $1" ;;
  esac
}

# uv shell autocompletion
eval "$(uv generate-shell-completion zsh)"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/deepanshu/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/deepanshu/.local/share/mamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [[ $? -eq 0 ]]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
