# curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
# fisher install gin0606/fish-bundler-aliases
# fisher install tuvistavie/fish-ssh-agent

# curl -L https://get.oh-my.fish | fish
# omf install bundler
# omf install archlinux
# omf install rails

set -x EDITOR 'nvim'
set -x GEM_HOME $HOME/.gem/ruby/2.5.0
set -x GEM_PATH $HOME/.gem/ruby/2.5.0

set -x GOPATH /data/go
set -x GOBIN $GOPATH/bin

set -x PATH $PATH $HOME/.gem/ruby/2.5.0/bin
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
