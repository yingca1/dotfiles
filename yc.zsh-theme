# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.

# Machine name.
local platform=`uname`
local ipaddr=$HOST
if [[ "$platform" == "Darwin" ]]; then
ipaddr=$(ifconfig | awk '/inet / && !/127.0.0.1/{print $2; exit}')
elif [[ "$platform" == "Linux" ]]; then
ipaddr=$(ip -4 -o addr show dev $(ip -4 route list 0/0 | awk '{print $5}') | awk '{split($4,a,"/");print a[1]}')
fi

local pub_ipaddr=$(curl -s checkip.amazonaws.com)

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name ||  echo ${HOST}"%{$reset_color%}[%{$fg[white]%}${ipaddr}%{$reset_color%}, %{$fg[cyan]%}${pub_ipaddr}%{$reset_color%}]"
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}on%{$reset_color%} git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"

# Prompt format: \n # USER@MACHINE[LanIP, PubIP]:DIRECTORY on git:BRANCH STATE [TIME] \n $
PROMPT="%{$terminfo[bold]$fg[blue]%}%{$reset_color%}%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[green]%}$(box_name)\
%{$fg[white]%}:\
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} \
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"
