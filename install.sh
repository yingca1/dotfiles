#!/bin/bash

cd "${HOME}"

DOTFILE_TMPL_BASE_URL=https://raw.githubusercontent.com/yingca1/dotfiles/master
DOTFILE_BACKUP_FOLDER="${HOME}"/dotfile_backup_$(date +%Y%m%d%H%M%S)

# list all dotfiles in an array
declare -a DOTFILES=(
    .gitconfig
    .vimrc
    .vimrc.plugins
    .zshrc
    .curlrc
    .wgetrc
)

# backup existing dotfiles
mkdir -p "${DOTFILE_BACKUP_FOLDER}"
for dotfile in "${DOTFILES[@]}"; do
    if [ -f "${HOME}"/"${dotfile}" ]; then
        mv "${HOME}"/"${dotfile}" "${DOTFILE_BACKUP_FOLDER}"/
    fi
done

if [ -f "${HOME}"/.oh-my-zsh ]; then
    mv "${HOME}"/.oh-my-zsh "${DOTFILE_BACKUP_FOLDER}"/
fi

if [ -f "${HOME}"/.vim ]; then
    mv "${HOME}"/.vim "${DOTFILE_BACKUP_FOLDER}"/
fi

if [ ! -f /bin/zsh ]; then
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt-get update && sudo apt-get install zsh -y
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install zsh
    fi
fi


# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# install zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# install zsh-theme
curl -fLo "${HOME}"/.oh-my-zsh/themes/yc.zsh-theme --create-dirs \
    "${DOTFILE_TMPL_BASE_URL}"/yc.zsh-theme

# install plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# for loop download remote dotfiles
for dotfile in "${DOTFILES[@]}"; do
    curl -fLo "${HOME}"/"${dotfile}" --create-dirs \
        "${DOTFILE_TMPL_BASE_URL}"/"${dotfile}"
done

# install tmux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt-get update && sudo apt-get install tmux -y

    curl -fLo "${HOME}"/.tmux.conf --create-dirs \
        "${DOTFILE_TMPL_BASE_URL}"/.tmux.conf.linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install tmux reattach-to-user-namespace

    curl -fLo "${HOME}"/.tmux.conf --create-dirs \
        "${DOTFILE_TMPL_BASE_URL}"/.tmux.conf.macOS
fi
touch ~/.tmux.conf.local

# install vim plugins
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt-get update && sudo apt-get install ripgrep bat fd-find silversearcher-ag fzf -y
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install ripgrep bat fd the_silver_searcher fzf
fi

VIMRC=${HOME}/.vimrc

touch ~/.vimrc.plugins.local

vim -E -s -u "$VIMRC" +PlugInstall +qall
