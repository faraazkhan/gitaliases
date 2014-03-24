# Export git aliases git dir
workflow_git_dir=$CWS_WORKFLOW_DIR/.git
workflow_work_tree=$CWS_WORKFLOW_DIR

# Get the current checked out branch
function current_branch() {
  export CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
}

# Report errors...nicely
function exit_error() {
  echo $1
    return 3
}

# List all feature branches on the local
function list_features(){
  git branch -a | grep -v remotes | grep -v origin | grep feature/ | cut -c 11-100
}

# Copied from: http://www.spinics.net/lists/git/msg142043.html
require_clean_work_tree () {
    # Update the index
    git update-index -q --ignore-submodules --refresh
    err=0

    # Disallow unstaged changes in the working tree
    if ! git diff-files --quiet --ignore-submodules --
    then
        echo >&2 "cannot $1: you have unstaged changes."
        git diff-files --name-status -r --ignore-submodules -- >&2
        err=1
    fi

    # Disallow uncommitted changes in the index
    if ! git diff-index --cached --quiet HEAD --ignore-submodules --
    then
        echo >&2 "cannot $1: your index contains uncommitted changes."
        git diff-index --cached --name-status -r --ignore-submodules HEAD -- >&2
        err=1
    fi

    if [ $err = 1 ]
    then
        echo >&2 "Please commit or stash them."
        return 1
    fi
}


# Load all supporting functions in the right order
source $CWS_WORKFLOW_DIR/automatic_updates
source $CWS_WORKFLOW_DIR/update_code
source $CWS_WORKFLOW_DIR/feature_management
source $CWS_WORKFLOW_DIR/miscellaneous

