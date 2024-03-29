# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sudo="sudo "
alias pacman="pacman --color=auto"
alias yay="yay --color=auto"
alias em="emacs"
alias pc="proxychains"

if [ -x "$(command -v exa)" ]; then
  alias ls="exa -alh"
else
  alias ls="ls -alh --color=auto"
fi
# docker
if [ -x $(command -v docker) ]; then
  alias sdc="sudo docker"
fi

alias grep="grep --color=auto"
alias tree="tree -lhC"

alias ca="conda activate"

alias cn="LANG=zh_CN.UTF-8"


# reload the completion
# it seems harmless and only makes sense if zsh-completions is installed
# https://github.com/zsh-users/zsh-completions#oh-my-zsh
autoload -U compinit && compinit


# beautiful less

# https://wiki.archlinux.org/index.php/Color_output_in_console#source-highlight
if [ -x "/usr/bin/source-highlight-esc.sh" ]; then
  export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
fi
# https://wiki.archlinux.org/index.php/Color_output_in_console#less
export LESS='-R '
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'


# enable fish-like syntax highlighting and autosuggestions
zsh_asgs_dir_list=(
    '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh'
    '/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
)
for zsh_asgs_dir in "${zsh_asgs_dir_list[@]}"; do
    if [ -r "${zsh_asgs_dir}" ]; then
        source "${zsh_asgs_dir}"
        break
    fi
done

zsh_hl_dir_list=(
    '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
)
for zsh_hl_dir in "${zsh_hl_dir_list[@]}"; do
    if [ -r "${zsh_hl_dir}" ]; then
        source "${zsh_hl_dir}"
        break
    fi
done


# if using WSL, define default screen
if [[ "$(uname -r)" =~ "(.?)Microsoft" ]]; then
    export DISPLAY=localhost:0.0

    # {{{ --- DBUS
    # To run dbus based GUI applications in ArchWSL,
    # you need the dbus-daemon running in background,
    # and to export corresponding variables.
    # Since there is no *systemctl*, we have to manage it ourselves.
    # I do 2 things below:
    #   1. Make sure that there is only one instance of dbus-daemon.
    #   2. Save dbus variables to the file "~/.dbus-var"
    if [[ -x "$(command -v dbus-launch)" ]]; then
        if [[ -z "$(pidof dbus-daemon)" ]]; then
            echo "$(dbus-launch)" > "${HOME}/.dbus-var"
        fi
        # https://unix.stackexchange.com/a/79077
        set -o allexport
        source "${HOME}/.dbus-var"
        set +o allexport
    fi
    # }}} --- DBUS
fi


# Remember to set the root path of anaconda!
air_conda_root_path="${HOME}/Programs/miniconda3"
# if using Miniconda3
if [ -d "${air_conda_root_path}" ]; then
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('${air_conda_root_path}/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${air_conda_root_path}/etc/profile.d/conda.sh" ]; then
        . "${air_conda_root_path}/etc/profile.d/conda.sh"
    else
         export PATH="${air_conda_root_path}/bin:$PATH"
    fi
fi
unset __conda_setup
unset air_conda_root_path
# <<< conda initialize <<<
fi
