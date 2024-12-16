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

## zsh plugins
```zsh
dotfiles submodule add https://github.com/zsh-users/zsh-completions.git ~/.config/zsh/plugins/zsh-completions  
dotfiles submodule add https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/plugins/powerlevel10k  
dotfiles submodule add https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions  
dotfiles submodule add https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting   
```  
  
## .zshrc
```
fpath=(~/.config/zsh/plugins/zsh-completions/src $fpath)
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
```

## Restore
```
git clone --bare git@github.com:rlibanez/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```
In case of already having some stock dotfiles which might get overwritten, you'll encounter something similar to the following the error:  
```
$ dotfiles checkout
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```
You could use ```$ dotfiles checkout -f``` which will rewrite the already existing files