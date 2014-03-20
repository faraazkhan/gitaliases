# Create a new feature branch
function new_feature() {
  git checkout develop
  git pull
  git checkout -b feature/$1
  git push -u origin feature/$1
}

# Get someone else's public feature branch
function get_feature() {
  git fetch origin
  git checkout --track origin/feature/$1
}

# Checkout a specific feature 
function checkout(){
  git checkout feature/$1
}

# Get the latest from Develop
function get_latest() {
  git fetch origin
  current_branch
  if ! [[ $CURRENT_BRANCH =~ ^feature ]]; then 
    echo '**********ERROR****************'
    echo 'You have the following features in progress:'
    feature_list
    echo "But You are currently on the:"; echo -n $CURRENT_BRANCH; echo ' branch'
    echo 'Please checkout the feature you want to get latest from develop on and try again'
  else
    git merge origin/develop
  fi
}

# push changes to gitlab..but first verify you have the latest
function push() {
  echo 'Do you have the latest from develop?(y/n)'
  read response
  if [[ $response == 'y' ]]; then
    echo 'pushing your changes to remote'
    git push
  else
    echo 'did not push your changes to remote'
    echo 'Please get_latest from develop first'
    echo 'to get latest from develop checkout <your feature> and'
    echo 'type get_latest'
  fi
}

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
function feature_list(){
  git branch -a | grep -v remotes | grep -v origin | grep feature/ | cut -c 11-100
}

# Commit ALL your changes
function commit-all(){
  cleanup
  git add -A
  git commit
}

# Delete all merge files
function cleanup(){
  rm -rf **/*.orig > /dev/null 2>&1
}

# Overwrite feature branch on gitlab
function overwrite() {
 echo 'Warning: You are about to overwrite the history on the '; echo -n $1; echo ' branch'
 echo 'If this branch is being used by others, they may lose their changes'
 echo 'Are you sure you want to do this(y/n)?'
 read response
 if [[response == 'y']]; then
   git checkout feature/$1
   git push --force
 else 
  echo 'Phew! That was close! No changes were made'
 fi
}

# undo all changes reset 

function undo_changes() {
 echo 'This will permanently delete all your changes. You cannot retrieve these again. Proceed?(y/n)'
 read response
 if [[response == 'y']]; then
   git reset HEAD --hard
 else
   echo 'No changes made'
 fi;
}

