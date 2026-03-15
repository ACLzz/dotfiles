install: stow install_zsh_autosuggestions 
	source ~/.zshrc

stow:
	stow .

update:
	git add .
	git stash
	git fetch && git pull
	git stash pop

chsh:
	chsh `whoami` -s /bin/zsh

install_zsh_autosuggestions:
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions