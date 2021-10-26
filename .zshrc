# Exports
export PATH="/usr/local/sbin:/snap/bin:$HOME/bin:$PATH"
export EDITOR='vim'

# Completion
fpath=($fpath ~/.zsh/completion)
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
autoload -Uz compinit && compinit
zmodload -i zsh/complist
_comp_options+=(globdots)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zsh/.zcompcache"
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

# Prompt
autoload -Uz promptinit && promptinit
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
#PROMPT=\$vcs_info_msg_0_'%F{cyan}%~%f '
PROMPT='%F{red}%m%f ''%F{cyan}%~%f '\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '(%b) '

# Extended globbing
setopt EXTENDED_GLOB
setopt AUTOCD

# Dir colors
zstyle ':completion:*:default' list-colors ''
source ~/.zsh/zcolors/zcolors.plugin.zsh
source ~/.zcolors

# History
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
HISTSIZE=1000000000
SAVEHIST=1000000000
HISTFILESIZE=1000000000
HISTFILE=~/.zsh_history
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey ' ' magic-space

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Aliases
alias ls='ls --color'

# Functions
chezmoi-cd() {
    cd $(chezmoi source-path)
}

# URL encoding
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
