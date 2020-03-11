# curl -L https://get.oh-my.fish | fish
# omf install bobthefish
# omf install bundler
# omf install archlinux
# omf install rails
# omf install pyenv

set fish_greeting ""

#eval (python -m virtualfish)

set -x EDITOR 'nvim'
set -x GEM_HOME $HOME/.gem/ruby/2.6.0
# set -x GEM_PATH $HOME/.gem/ruby/2.6.0 $GEM_PATH /usr/lib/ruby/gems/2.6.0

set -x GOPATH /data/go
set -x GOBIN $GOPATH/bin

set -x PATH $PATH $HOME/.gem/ruby/2.6.0/bin
set -x PATH $PATH /data/go/bin

set -x ANDROID_HOME $HOME/Android/Sdk
set -x ANDROID_SDK_ROOT $HOME/Android/Sdk
set -x PATH $PATH $ANDROID_HOME/platform-tools:$PATH
set -x PATH $PATH $ANDROID_HOME/tools:$PATH

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

# https://gist.github.com/gerbsen/5fd8aa0fde87ac7a2cae
setenv SSH_ENV $HOME/.ssh/environment

function start_agent                                                                                                                                                                    
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV 
    . $SSH_ENV > /dev/null
    ssh-add
end

function test_identities                                                                                                                                                                
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ] 
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end  
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end  
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else 
        start_agent
    end  
end
