# oh my zsh stuff
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="cloud"
plugins=(git extract z)
source $ZSH/oh-my-zsh.sh

# set default editor to vim
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# terminal colors
export TERM='xterm-256color'

# set the system path
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

#some aliases
alias s='sudo'
alias svi='sudo vim'
alias vi='vim'
alias rf='rm -rf'
alias srf='sudo rm -rf'
alias files='pantheon-files'
alias tmp='cd /tmp'
alias ag='sudo apt-get'
alias maj='sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean -y'
alias addrepo='sudo add-apt-repository'
alias chrome='google-chrome'

# virtualenv wrapper
# where to store our virtual envs
export WORKON_HOME=$HOME/.virtenvs
# where is the virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper.sh

