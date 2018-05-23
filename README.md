
## Basic info

Fish Shell, i3, neovim

## How to use

You probably can't clone it as your ~ is not empty. Do this instead:

```
# Step 0: backup your ~ directory (!)
cd ~
git init
git remote add origin git@github.com:rs-pro/dotfiles.git
git pull origin master
# delete any files git complains about and repeat until previous command succeeds
git branch --set-upstream-to=origin/master master
git pull
```
