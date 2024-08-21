## zsh
https://wiki.archlinux.org/title/Zsh  
https://github.com/zsh-users/zsh-completions.git  
https://github.com/romkatv/powerlevel10k.git  
https://github.com/zsh-users/zsh-syntax-highlighting.git  
https://github.com/zsh-users/zsh-autosuggestions.git  


## dotfiles
https://wiki.archlinux.org/title/Dotfiles  
https://github.com/gabrilov/dotfiles  


## Initial setup
```zsh
git init --bare ~/.dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
dotfiles config status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
source $HOME/.zshrc

dotfiles add README.md .zshrc
dotfiles commit -m "Initial README and .zshrc"
```
