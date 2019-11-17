echo "Setting up all your dotfiles!"

echo "Backing up your current dotfiles..."

mv ~/.vimrc ~/.vimrc.old
mv ~/.zshrc ~/.zshrc.old
mv ~/.tmux.conf ~/.tmux.conf.old

echo "Linking the basic dotfiles to your home directory..."

ln -sf "$PWD/.vimrc" ~/.vimrc
ln -sf "$PWD/.zshrc" ~/.zshrc
ln -sf "$PWD/.tmux.conf" ~/.tmux.conf

# vim

echo "Installing pathogen for vim, a simple plugin manager..."

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Installing the following plugins for vim:"

echo "* CtrlP"
( cd ~/.vim/bundle && git clone git@github.com:kien/ctrlp.vim.git )

echo "* UltiSnips"
( cd ~/.vim/bundle && git clone git@github.com:kien/sirver/ultisnips.vim.git )

echo "* EditorConfig Support"
( cd ~/.vim/bundle && git clone git@github.com:editorconfig/editorconfig-vim.git )

echo "* TypeScript Support"
( cd ~/.vim/bundle && git clone git@github.com:leafgarland/typescript-vim.git )

# zsh

echo "Installing zsh..."

sudo apt install zsh -y
chsh $(which zsh)

echo "Installing Oh My Zsh!..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# tmux

echo "Installing tmux"

sudo apt install tmux -y

