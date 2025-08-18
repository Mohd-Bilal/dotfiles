
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp $HOME/git/dotfiles/zsh-themes/half-life-alpha.zsh-theme $HOME/.oh-my-zsh/themes/

git clone https://github.com/jeffreytse/zsh-vi-mode  $HOME/.config/tmux/plugins/zsh-vi-mode

rm -f $HOME/.config/nvim
ln -s $HOME/git/dotfiles/nvim $HOME/.config/nvim 

rm -f $HOME/.config/tmux
ln -s $HOME/git/dotfiles/tmux $HOME/.config/tmux 

rm -f $HOME/.zshrc
ln -s $HOME/git/dotfiles/.zshrc $HOME/.zshrc 

rm -f $HOME/.config/ghostty
ln -s $HOME/git/dotfiles/ghostty $HOME/.config/ghostty
