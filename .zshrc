export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode auto

# Enable ssh-agent features
zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent helper ksshaskpass
zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa2 id_github

DISABLE_MAGIC_FUNCTIONS="true"

zle -N menu-search
zle -N recent-paths
zle -N insert-unambiguous-or-complete

plugins=(
  # zsh-autocomplete
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
  git
  sudo
  ssh-agent
  mise
  fzf-tab
  brew
  z
  colorize
  command-not-found
  common-aliases
  dirhistory
  aliases
  npm
  yarn
  docker
  vscode
)

source $ZSH/oh-my-zsh.sh

# Example aliases
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

# Personal aliases
alias cls="clear"
alias l='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'
alias cat="ccat"
alias less="cless"

# Plugins settings
ZSH_COLORIZE_TOOL=pygmentize
ZSH_COLORIZE_STYLE="catppuccin-mocha"
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256

# PATH
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
export PATH="$HOME/go/bin:$PATH"

# Starship
eval "$(starship init zsh)"

# Brew
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# mise
eval "$(/home/dsin/.local/bin/mise activate zsh)"

autoload -Uz compinit && compinit
