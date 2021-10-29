
# How to make an R library: starting with nothing!

* Optional but recommended: *

- Open your Terminal 
- Install the rproj module with pip
- Install the GitHub CLI

```shell
pip install git+https://github.com/zhuchcn/Rproj.git
brew install gh
```

<!-- - Create folder for library. Name of folder will be name of library (make sure your working directory is whichever folder you want your new library repo to be)
```shell
mkdir cunivis
cd cunivis
``` -->

- Initialize git and stuff
- Make sure to elect to make a .gitignore file, with R framework
```shell
gh auth login
gh repo create cunivis
cd cunivis
# git init main
git pull --set-upstream origin main
rproj R
git add . && git commit -m "initial commit"
open R.Rproj
```

