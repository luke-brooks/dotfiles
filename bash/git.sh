# install git-completion.bash using:
# cd ~ && curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
source ~/git-completion.bash

# https://gist.github.com/trey/2722934
# https://stackoverflow.com/questions/12870928/mac-bash-git-ps1-command-not-found/12871094#12871094
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='[\u@kc \w$(__git_ps1)]\$ '

# https://ohshitgit.com/

alias gc="git checkout"
alias gc_r="git checkout release_candidate"
alias gs="git status"
alias gf="git fetch --all --prune"

gr() { # git-reset branch
    [[ $1 == . ]] && current_branch="$(git branch --show-current)" || current_branch=$1
    git reset --hard origin/$current_branch
}
gcm() { # git-commit-msg
    git commit -m "$*"
}
gbs() { # git-branch-search
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