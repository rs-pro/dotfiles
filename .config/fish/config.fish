# curl -L https://get.oh-my.fish | fish
# omf install https://github.com/danhper/fish-ssh-agent
# omf install bundler
# omf install archlinux
# omf install bobthefish

# !THIS DOESNT WORK!
# omf install https://github.com/jorgebucaran/nvm.fish
# THIS DOES:
# curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
# fisher install jorgebucaran/nvm.fish

set fish_greeting ""

#eval (python -m virtualfish)

# omf install https://github.com/gin0606/fish-bundler-aliases - doesnt work
abbr be "bundle exec"
abbr bl "bundle list"
abbr bp "bundle package"
abbr bo "bundle open"
abbr bout "bundle outdated"
abbr bu "bundle update"
abbr bi bundle install --jobs=4
abbr bip bundle install --jobs=4 --path .bundle
abbr bcn "bundle clean"

set -x EDITOR 'nvim'

set -x GOPATH /data/go
set -x GOBIN $GOPATH/bin
#set -x PATH $PATH /data/go/bin

set -x FZF_DEFAULT_OPTS "--history=$HOME/.fzf_history"

set -x GOPRIVATE rscz.ru

#set -x GEM_HOME $HOME/.gem/ruby/2.7.0
#set -x PATH $PATH $HOME/.gem/ruby/2.7.0/bin

set -x ANDROID_HOME $HOME/Android/Sdk
set -x ANDROID_SDK_ROOT $HOME/Android/Sdk

#set -a fish_user_paths /data/go/bin
#set -a fish_user_paths $ANDROID_HOME/platform-tools
#set -a fish_user_paths $ANDROID_HOME/tools

# run this once in shell:
#set --universal fish_user_paths $fish_user_paths /data/go/bin
#set --universal fish_user_paths $fish_user_paths $ANDROID_HOME/platform-tools
#set --universal fish_user_paths $fish_user_paths $ANDROID_HOME/tools
#set --universal fish_user_paths $fish_user_paths /data/mattermost/mattermost-server/bin/
#set --universal fish_user_paths $fish_user_paths ~/.rbenv/shims
#set --universal fish_user_paths $fish_user_paths ~/.config/composer/vendor/bin/
#
# view with set -S fish_user_paths
# delete with set -e fish_user_paths 


status --is-interactive; and source (rbenv init -|psub)

function ll
  ls --human-readable -l $argv
end

function yi
  yarn install
end

function yu
  yarn update
end

function rdm
  rake db:migrate $argv
end
function rdr
  rake db:rollback $argv
end
function cpd
  cap production deploy
end
function csd
  cap staging deploy
end

function rds
  rake db:seed
end

function rg
  rails generate $argv
end

function rd
  rails destroy $argv
end

function rs
  rails server
end

function rc
  rails console
end

function gg
  go get $argv
end

function ggu
  go get -u $argv
end

function gp
  git pull --rebase
end

function gco
  git checkout $argv
end

function grm
  go run main.go $argv
end

function yain
  yay -S $argv
end

if ssh-add -l > /dev/null
else
  ssh-add
end
