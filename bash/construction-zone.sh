
# searches git log for specific commit wording
# alias git_search=git config --global alias.search '!f() { git log -S "$1" --source --all; }; f'


# Run 'nvm use' automatically every time there's
# a .nvmrc file in the directory. Also, revert to default
# version when entering a directory without .nvmrc
#
enter_directory() {
if [[ $PWD == $PREV_PWD ]]; then
 return
fi
PREV_PWD=$PWD
if [[ -f ".nvmrc" ]]; then
   nvm use
   NVM_DIRTY=true
elif [[ $NVM_DIRTY = true ]]; then # this may be broken...
   nvm use default
   NVM_DIRTY=false
fi
}
export PROMPT_COMMAND=enter_directory