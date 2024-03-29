#zmodload zsh/zprof

source $PROJECT_FOLDER/utils.zsh

# ----------------- FZF -------------------------
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  rg --files --hidden --follow --glob "!.git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# ----------------- PROMPT ----------------------
source $PROJECT_FOLDER/submodules/powerlevel10k/powerlevel10k.zsh-theme

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ -f ~/.config/zsh/.p10k.zsh ]] && source ~/.config/zsh/.p10k.zsh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ------------------- COMPINIT --------------
autoload -Uz compinit
for dump in $ZDOTDIR/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# ------------------- GIT ---------------------
source $PROJECT_FOLDER/submodules/ohmyzsh/lib/git.zsh
source $PROJECT_FOLDER/submodules/ohmyzsh/plugins/git/git.plugin.zsh

# ------------------ ALIASES -----------------
source $PROJECT_FOLDER/aliases.zsh
source $PROJECT_FOLDER/submodules/ohmyzsh/lib/completion.zsh

# ----------------- CONDA --------------------
if [[ -d $HOME/.miniconda3 ]]; then
  __conda_setup="$('$HOME/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "$HOME/.miniconda3/etc/profile.d/conda.sh" ]; then
          . "$HOME/.miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="$HOME/.miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
fi
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Tab Completion Menu
zmodload zsh/complist
bindkey -M menuselect "${terminfo[kcbt]}" reverse-menu-complete
has_command startx && [[ ($TTY = /dev/tty1) ]] && startx || echo "Let's start coding!"
