# ================================
# PATH & ENV
# ================================

# Core paths (priority first)
export PATH="$HOME/.fzf/bin:$HOME/.local/bin:$PATH"

# fnm (Node)
# export FNM_PATH="$HOME/.local/share/fnm"
# if [ -d "$FNM_PATH" ]; then
#   export PATH="$FNM_PATH:$PATH"
#   eval "$(fnm env --use-on-cd --shell zsh)"
# fi

export FNM_PATH="$HOME/AppData/Local/Microsoft/WinGet/Packages/Schniz.fnm_Microsoft.Winget.Source_8wekyb3d8bbwe/"
eval "$(fnm env --use-on-cd)"

# Neovim (Windows path)
[ -d "/c/Program Files/Neovim/bin" ] && export PATH="/c/Program Files/Neovim/bin:$PATH"


# ================================
# HISTORY
# ================================

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory sharehistory
setopt hist_ignore_dups hist_ignore_space
setopt inc_append_history


# ================================
# PLUGINS (Antidote)
# ================================

source ~/.antidote/antidote.zsh
antidote load


# ================================
# COMPLETION
# ================================

autoload -Uz compinit
compinit


# ================================
# TOOLS
# ================================

# zoxide
eval "$(zoxide init zsh)"
## bug - remove after updating zoxide
function __zoxide_pwd() {
    command cygpath -w "$(builtin pwd -L)"
}

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Improve Ctrl+R UI
export FZF_CTRL_R_OPTS="--height 40% --reverse --border --preview 'echo {} | bat --color=always --language=sh'"

# fzf config (WSL-safe)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'

export FZF_CTRL_T_OPTS="--preview 'bat --color=always {} || cat {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"


# ================================
# FZF TAB
# ================================

# Quick file search using fd and open with Neovim
alias ff='nv $(fd --type f --hidden | fzf --preview "bat --color=always {}")'

zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:*' fzf-preview \
  'bat --color=always $realpath 2>/dev/null || eza --color=always $realpath'


# ================================
# SMART CD
# ================================

cd() {
  if [[ "$1" == "." || "$1" == ".." || "$1" == "-" || "$1" == /* ]]; then
    builtin cd "$@"
  else
    z "$@"
  fi
}


# ================================
# ALIASES
# ================================

alias ls='eza --icons'
alias ll='eza -al --icons'
alias la='eza -a --icons'
alias tree='eza --tree --icons'

alias nv='nvim'

alias g='git'
alias lg='lazygit'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

alias grep='rg'
alias cat='bat'

alias cls='clear'


# ================================
# KEYBINDINGS
# ================================

# word navigation
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# essentials
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^W' backward-kill-word
bindkey '^L' clear-screen

# fzf history
bindkey '^R' fzf-history-widget


# ================================
# UTILITIES
# ================================

# yazi integration
y() {
  local tmp="$(mktemp -t yazi-cwd.XXXXXX)" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [[ -d "$cwd" ]] && cd "$cwd"
  rm -f "$tmp"
}


# ================================
# FIXES
# ================================

autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic


# ================================
# PROMPT
# ================================

eval "$(starship init zsh)"
export STARSHIP_LOG=error
