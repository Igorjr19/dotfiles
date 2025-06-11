# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="starship"
# ZSH_THEME_RANDOM_CANDIDATES=("robbyrussell" "agnoster" "powerlevel10k/powerlevel10k")

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto

# Enable ssh-agent features
zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent helper ksshaskpass
zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa2 id_github

DISABLE_MAGIC_FUNCTIONS="true"

#  Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

zle -N menu-search
zle -N recent-paths
zle -N insert-unambiguous-or-complete

plugins=(
  git
  asdf
  brew
  zsh-autosuggestions
  # zsh-autocomplete
  zsh-syntax-highlighting
  fast-syntax-highlighting
  z
  ssh-agent
  colorize
  command-not-found
  common-aliases
  dirhistory
  aliases
  kitty
  npm
  yarn
  sudo
  docker
  vscode
)

source $ZSH/oh-my-zsh.sh

# Example aliases
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

# Personal aliases
alias cls="clear"
# alias ls="colorls -A --sd --dark" 
# alias l="colorls --sd --dark"
# alias la="colorls -A --sd --dark"
# alias lt="colorls --tree=3 --sd --dark"
# alias ltu="colorls --tree=10 --sd --dark"

# Plugins settings
ZSH_COLORIZE_TOOL=chroma
ZSH_COLORIZE_STYLE="colorful"
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256

# PATH
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export STARSHIP_CONFIG="$HOME/.config/starship.toml"

# Starship
eval "$(starship init zsh)"

# Brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


autoload -Uz compinit && compinit

# colorls
source $(dirname $(gem which colorls))/tab_complete.sh

