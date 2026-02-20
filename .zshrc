# path
export GOPATH="$HOME/go/bin"
export LOCAL_PATH="$HOME/.local/bin"
export PATH="$PATH:$GOPATH:$LOCAL_PATH"

# oh my zsh
ZSH_THEME="crunch"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

zstyle ':omz:update' mode reminder
plugins=(git zsh-autosuggestions docker docker-compose colored-man-pages virtualenv)

source $HOME/.oh-my-zsh/oh-my-zsh.sh

# global env variables
export LANG="en_US.UTF-8"
export EDITOR="vim"

# auto scripts on shell startup
## update system reminder
if [[ `date | awk '{print $1}'` == 'Sat' ]]; then
	cowsay -f satanic 'You need to update your system today'
fi

# unnecessary aliases :)
alias shutdown="sudo shutdown"
alias reboot="sudo reboot"
alias oculante="setsid oculante $@"
alias mount="sudo mount"
alias umount="sudo umount"

# keybindings cause I hate default ones
bindkey '^H' backward-kill-word

