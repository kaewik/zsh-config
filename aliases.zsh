source $PROJECT_FOLDER/utils.zsh
source $PROJECT_FOLDER/submodules/ohmyzsh/plugins/common-aliases/common-aliases.plugin.zsh
source $PROJECT_FOLDER/submodules/ohmyzsh/lib/directories.zsh
alias ls='ls --color=auto'
if has_command tree; then
  alias treeL='tree --du -h -L'
  alias t='tree --du -h -L 1'
  alias tt='tree --du -h -L 2'
  alias tt='tree --du -h -L 3'
fi
