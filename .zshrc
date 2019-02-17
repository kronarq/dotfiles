# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/kronarq/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
  #POWERLEVEL9K_MODE='awesome-fontconfig'
  #POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  #POWERLEVEL9K_STATUS_VERBOSE=false
  #POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir vcs virtualenv)
  #POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time background_jobs)
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

plugins=(archlinux docker git jsontools pip python systemd zsh-autosuggestions zsh-syntax-highlighting history-substring-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export PATH="$HOME/.config/scripts:$HOME/.bin:$PATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#export TERM="xterm-256color"
export TERM="xterm-termite"
export TERMINAL="termite"

export DEFAULT_USER=kronarq
export TZ='/usr/share/zoneinfo/America/Chicago'
export VISUAL='vim'
export BROWSER='google-chrome-stable'

export QT_QPA_PLATFORMTHEME="qgnomeplatform"
#export QT_QPA_PLATFORMTHEME="qt5ct"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"


alias ssh='TERM=xterm-256color ssh'
alias tmux='TERM=xterm-256color tmux -u'
alias g='git'
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vconf-i3='vim ~/.config/i3/config'
alias vconf-compton='vim ~/.config/compton.conf'
alias vconf-termite='vim ~/.config/termite/config'
alias vconf-polybar='vim ~/.config/polybar/config'
alias vconf-zsh='vim ~/.zshrc'
alias virsh='sudo EDITOR=vim virsh'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# cd up to n dirs
# using:  cd.. 10   cd.. dir
function cd_up() {
  case $1 in
    *[!0-9]*)                                          # if no a number
      cd $( pwd | sed -r "s|(.*/$1[^/]*/).*|\1|" )     # search dir_name in current path, if found - cd to it
      ;;                                               # if not found - not cd
    *)
      cd $(printf "%0.0s../" $(seq 1 $1));             # cd ../../../../  (N dirs)
    ;;
  esac
}

alias 'cd..'='cd_up'                                # can not name function 'cd..'

if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

