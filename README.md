#clone repo
git clone https://github.com/<your-username>/my-zsh-config.git

#copy files
cp my-zsh-config/.zshrc ~/
cp -r my-zsh-config/custom ~/.oh-my-zsh/
cp -r my-zsh-config/themes ~/.oh-my-zsh/
cp my-zsh-config/.p10k.zsh ~/

#reload shell
source ~/.zshrc
