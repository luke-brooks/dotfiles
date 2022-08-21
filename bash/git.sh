source ~/git-completion.bash

# https://gist.github.com/trey/2722934
# https://stackoverflow.com/questions/12870928/mac-bash-git-ps1-command-not-found/12871094#12871094
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='[\u@kc \w$(__git_ps1)]\$ '

alias gc="git checkout"
alias gs="git status"
alias gf="git fetch --all --prune"

gr() {
    [[ $1 == . ]] && current_branch="$(git branch --show-current)" || current_branch=$1
    git reset --hard origin/$current_branch
}
gbs() {
    git branch -a | grep "$1"
}
gpnb() { # git-push-new-branch
    current_branch="$(git branch --show-current)"
    git push --set-upstream origin ${current_branch}
}

# test this out with params
year-review() {
    git log --author="Luke Brooks" --after="2021-1-1" --before="2021-12-31" --date=short --no-merges --pretty=format:'%h was %an, %ad, message: %s' | tail -r
}