## Instructions
* Run this in Git Bash or some posix terminal  

``` 
    cd ~ && git clone https://gitlab.cgifederal.com/faraazkhan/gitaliases.git  
```

```
    echo "source ~/gitaliases/git_aliases" >> ~/.bashrc    
```

```
    source ~/.bashrc 
```
* Enjoy the shortcuts!

## Workflow 

To create a new feature branch (that does not yet exist on the server) run:  

 ```
  new_feature <feature_name>
  example:
  new_feature DFCPOC-37_Filters
 ```

To get an existing feature from Gitlab run:  

```
  get_feature <feature_name>
  example:
  get_feature DFCPOC-37_Filters #notice this does not include the feature/ that is in the branch name
```

To checkout a feature branch (that already exists on your local):  

```
checkout <feature_name>
example: 
checkout DFCPOC-37_Filters
```

To Get Latest changes from develop in your feature

```
checkout <feature_name> #first checkout the feature
get_latest
example:
checkout DFCPOC-37_Filters
get_latest
```
To Push your changes:  

```
push
```
To see all features currently in progress on your local  

```
feature_list
```

To commit all your changes (including untracked files):  

```
commit-all 
```

To clean up .orig files after resolving conflicts

```
cleanup
```

To overwrite history on server. For example when git complains that
your local branch has "diverged" from origin after a merge/rebase. 
Warning: Use this with caution, this will make some commits
irrecoverable and always consult / inform other people using the same
branch since they will have to delete that branch and pull again.  

```
overwrite <feature_name>
example: 
overwrite DFCPOC-37_Filters
```

To undo all your changes and return to the last commit on Gitlab.
Warning: This is also a dangerous thing, it will permanently delete all
your changes and they cannot be recovered. Do this only if you
really hate the code you just wrote and never want to see it again
:)    
```
undo_changes
```

To see your recent activities  
```
whatdidido
```

To see your last commit 
```
last_commit
```

To see more history
Warning: I have seen this one crash a few git bash sessions on
windows. If it happens to you, just close your terminal and start
again
```
show_history
```
