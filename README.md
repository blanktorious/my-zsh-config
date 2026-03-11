# my-zsh-config

My personal zsh configuration with oh-my-zsh and powerlevel10k.

## Quick Install

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/blanktorious/my-zsh-config/master/install.sh)
```

Or if you've already cloned the repo:

```bash
./install.sh
```

After installation, run `exec zsh` or open a new terminal.

## What it installs

- [zsh](https://www.zsh.org/)
- [oh-my-zsh](https://ohmyz.sh/)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme
- `.zshrc`, `.p10k.zsh`, and custom plugins/themes from this repo

## Manual Steps

```bash
# Install zsh
sudo apt update && sudo apt install zsh
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Clone and copy config
git clone https://github.com/blanktorious/my-zsh-config.git
cp my-zsh-config/.zshrc ~/
cp -r my-zsh-config/custom ~/.oh-my-zsh/
cp my-zsh-config/.p10k.zsh ~/

exec zsh
```
