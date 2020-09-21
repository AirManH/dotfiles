# set root path of this repo
cd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd -P)

cp ${DOTFILES_ROOT}/zsh/.zshrc ${HOME}/.zshrc
