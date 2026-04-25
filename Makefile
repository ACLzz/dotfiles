update:
	git add .
	git stash
	git fetch && git pull
	git stash pop

install: stow install_zsh_autosuggestions install_space_backgrounds
	source ~/.zshrc

stow:
	stow .

chsh:
	chsh `whoami` -s /bin/zsh

install_zsh_autosuggestions:
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

install_space_backgrounds:
	wget -O ~/.local/bin/space_backgrounds https://github.com/Muneeb1195/PixelSpace/releases/download/v0.1.0-rc/SpaceBackground-linux.x86_64
	chmod +x ~/.local/bin/space_backgrounds
