# set root path of this repo
cd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd -P)


# backup if the old one exists
if [ -f ${HOME}/.zshrc ]; then
  mv ${HOME}/.zshrc ${HOME}/.zshrc.old
fi
cp ${DOTFILES_ROOT}/zsh/.zshrc ${HOME}/.zshrc

source "${DOTFILES_ROOT}/scripts/install.sh"
