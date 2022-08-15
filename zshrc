PROJECT_FOLDER=/Users/lukasz/git/zsh-config
zmodload zsh/zprof

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# ----------------- NVM ----------------------
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
source $PROJECT_FOLDER/submodules/zsh-nvm/zsh-nvm.plugin.zsh

# ----------------- Python ---------------
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# ---------------- Cargo ----------------
export PATH="$HOME/.cargo/bin:$PATH"

# ---------------- GNU ------------------
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"



# ----------------- GHCUP -----------------------
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# ----------------- LOCAL BIN ------------------
PATH="$HOME/.local/bin:$PATH"

# ----------------- FZF -------------------------
[ -d $HOME/.local/share/nvim/site/pack/packer/start/fzf ] && [ -f $PROJECT_FOLDER/.fzf.zsh ] && source $PROJECT_FOLDER/.fzf.zsh
# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# ----------------- NVIM -----------------------
export EDITOR="nvim"
export VISUAL="nvim"

# ----------------- SYSTEM NPM ------------------------
export PATH="/usr/local/lib/node_modules:$PATH"

# ----------------- LLVM Settings -----------------
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# ----------------- PROMPT ----------------------
source $PROJECT_FOLDER/submodules/powerlevel10k/powerlevel10k.zsh-theme

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# ------------------- GIT ---------------------
source $PROJECT_FOLDER/submodules/ohmyzsh/lib/git.zsh
source $PROJECT_FOLDER/submodules/ohmyzsh/plugins/git/git.plugin.zsh

# ------------------- COMPINIT --------------
autoload -Uz compinit
for dump in $ZDOTDIR/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# ------------------ ALIASES -----------------
source $PROJECT_FOLDER/aliases.zsh
source $PROJECT_FOLDER/submodules/ohmyzsh/lib/completion.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Tab Completion Menu
zmodload zsh/complist
bindkey -M menuselect "${terminfo[kcbt]}" reverse-menu-complete

