#install dependencies
sudo apt update
sudo apt install zsh
zsh --version
chsh -s $(which zsh)

#restart terminal
exec zsh

0

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

#clone repo
git clone https://github.com/blanktorious/my-zsh-config.git

#copy files
cp my-zsh-config/.zshrc ~/
cp -r my-zsh-config/custom ~/.oh-my-zsh/
cp my-zsh-config/.p10k.zsh ~/

#restart terminal
exec zsh

#reload shell
source ~/.zshrc
