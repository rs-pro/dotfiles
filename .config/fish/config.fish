# curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
# fisher add gin0606/fish-bundler-aliases
# fisher add tuvistavie/fish-ssh-agent
# fisher add attilagyorffy/plugin-bundler
# fisher add oh-my-fish/plugin-archlinux
# fisher add oh-my-fish/plugin-rails
# fisher add oh-my-fish/theme-bobthefish

set fish_greeting ""

set -x EDITOR 'nvim'
set -x GEM_HOME $HOME/.gem/ruby/2.6.0
set -x GEM_PATH $HOME/.gem/ruby/2.6.0

set -x GOPATH /data/go
set -x GOBIN $GOPATH/bin

set -x PATH $PATH $HOME/.gem/ruby/2.6.0/bin
set -x PATH $PATH /data/go/bin

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
  yaourt -S $argv
end

if ssh-add -l > /dev/null
else
  ssh-add
end
