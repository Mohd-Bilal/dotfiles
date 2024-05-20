

ln -s /home/bilal/git/dotfiles/nvim /home/bilal/.config/nvim 
ln -s /home/bilal/git/dotfiles/tmux /home/bilal/.config/tmux 
ln -s /home/bilal/git/dotfiles/alacritty /home/bilal/.config/alacritty 
ln -s /home/bilal/git/dotfiles/.zshrc /home/bilal/.zshrc 


git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp /home/bilal/git/dotfiles/zsh-themes/half-life-alpha.zsh-theme /home/bilal/.oh-my-zsh/themes/

git clone https://github.com/jeffreytse/zsh-vi-mode  $ZSH_CUSTOM/plugins/zsh-vi-mode
