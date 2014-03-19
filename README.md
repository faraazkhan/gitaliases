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

To Rebase your feature against develop (i.e Get Latest from Develop):  

```
checkout <feature_name> #first checkout the feature
rebase
example:
checkout DFCPOC-37_Filters
rebase
```
To Push your changes:  

```
push
```
To see all features currently in progress on your local  

```
feature_list
```