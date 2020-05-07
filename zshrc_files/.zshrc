# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/Users/asim/Downloads/tf/:/usr/local/bin:/Users/asim/Downloads/google-cloud-sdk/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/asim/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="blue"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="yellow"
POWERLINE9K_MODE='nerd-font-complete'
plugins=(… zsh-completions)
plugins=(zsh-autosuggestions)
autoload -U compinit && compinit

zsh_wifi_signal(){
        local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I) 
        local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

        if [ "$airport" = "Off" ]; then
                local color='%F{yellow}'
                echo -n "%{$color%}Wifi Off"
        else
                local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
                local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
                local color='%F{yellow}'

                [[ $speed -gt 100 ]] && color='%F{green}'
                [[ $speed -lt 50 ]] && color='%F{red}'

                echo -n "%{$color%}$ssid $speed Mb/s%{%f%}" # removed char not in my PowerLine font 
        fi
}

#zsh_wifi_signal(){
#    local signal=$(nmcli device wifi | grep yes | awk '{print $8}')
#    local color='%F{yellow}'
#    [[ $signal -gt 75 ]] && color='%F{green}'
  #  [[ $signal -lt 50 ]] && color='%F{red}'
 #   echo -n "%{$color%}\uf230  $signal%{%f%}" # \uf230 is 
#}
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context time battery dir vcs virtualenv custom_wifi_signal)
POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND=(red1 orangered1 darkorange orange1 gold1 yellow1 yellow2 greenyellow chartreuse1 chartreuse2 green1)
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
 ZSH_CUSTOM=/Users/asim/oh-my-zsh-custom/custom

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
battery
git
zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh
export PATH=/Users/asim/terraform:$PATH
export QA_AUTH=/Users/asim/asim/gcloud/auth/keys/qa/autofocus-qa-f258568dcd6a.json
export GOOGLE_APPLICATION_CREDENTIALS=/Users/asim/asim/gcloud/auth/keys/qa/autofocus-qa-f258568dcd6a.json


# User configuration

 export MANPATH="/Users/asim/terraform:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/asim/.sdkman"
export TF_PATH="/Users/asim/Download/"

[[ -s "/Users/asim/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/asim/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/asim/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/asim/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/asim/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/asim/Downloads/google-cloud-sdk/completion.zsh.inc'; fi



prompt_context () { }

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_BASE="$HOME/.fzf"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plugins=(
  ...
  fzf
)
alias pkc='HTTPS_PROXY=socks5://localhost:9050 kubectl'
export AF_PROD_KEY=/Users/asim/asimdevopsdirectory/svcaccount/autofocus-prd/autofocus-1-e4031ea38577.json                                              
export AF_QA_KEY=/Users/asim/asimdevopsdirectory/svcaccount/autofocus-qa/autofocus-qa-18c5cdfae2d6.json                                                        
export AF_DEV_KEY=/Users/asim/asimdevopsdirectory/svcaccount/autofocus-dev/autofocus-dev-c9797cbdd03e.json


