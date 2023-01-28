# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="${PATH}:${HOME}/.local/bin/"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Node version manager
export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST


# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Disable system bell
if [ -n "$DISPLAY" ]; then
  xset b off
fi

# Installed plugins
plugins=(
	git
	zsh-autosuggestions
	vi-mode
	branch
	aws
)

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en

# Preferred editor
export EDITOR=nvim
export VISUAL=nvim

# Path for golang export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/shivkar2n/go/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# {{{ CUSTOM ALIASES
alias cpscrt="cat ~/Documents/Important/token.txt | xclip -sel clip" # Get gh token
alias gdif="git diff --color | diff-so-fancy | less" # Preview git difference in file
alias gsdif="git diff --staged | diff-so-fancy | less" # Preview git difference in file
alias ccat='pygmentize -g | less' # Preview color output terminal
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
#}}}


[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"

PROMPT='%B%F{red}%n%f@%B%F{blue}${${(%):-%m}#zoltan-}%f %B%F{green}%1~%f%b '
RPROMPT='%B%F{yellow}${vcs_info_msg_0_}'
export PATH=$PATH:/home/shivkar2n/.spicetify
