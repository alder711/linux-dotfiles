#
# ~/.zshrc
#

# The following lines were added by compinstall
zstyle :compinstall filename '/home/trevorbautista/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=5000
SAVEHIST=5000
setopt notify
setopt appendhistory
bindkey -v
# End of lines configured by zsh-newuser-install










#=================================================
# POWERLEVEL9K CONFIGURATION
#=================================================
# Stylizing the prompt:
# https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
#
# To see RGB color codes and what they look like, use the following in a ZSH shell:
# for code ({000..255}) print -P -- "$code: %F{$code}████████████████████████████████████████████%f"

# if not a display, set basic prompt
if [ -z "$DISPLAY" ]; then

	export PROMPT=%(!."%F{red}░▒▓%K{red}%F{020}[%#][%n@%m]➜ %F{red}%K{cyan}▶%F{020}%K{cyan}%B%~%b%k%f%F{cyan}▶%k%f "."%F{yellow}░▒▓%K{yellow}%F{020}[%#][%n@%m]➜ %F{yellow}%K{cyan}▶%F{020}%K{cyan}%B%~%b%k%f%F{cyan}▶%k%f ")


# if display, set advanced prompt
else
	export TERM="xterm-256color"

	#Powerlevel Linux Icon
	POWERLEVEL9K_LINUX_ICON='%F{cyan}\uf300 %F{white}arch%F{cyan}linux'

	# Set up Antigen
	#source /usr/share/zsh/share/antigen.zsh
	source /home/trevorbautista/.zsh/zsh/share/antigen.zsh
	antigen use oh-my-zsh

	# Antigen bundles
	antigen bundle git
	antigen bundle command-not-found
	antigen bundle zsh-users/zsh-syntax-highlighting

	# Enable Powerlevel9K ZSH theme
	#source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme # Ownership of /home/trevorbautista/.antigen/bundles: root:trevorbautista
	source /home/trevorbautista/.zsh/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
	antigen theme powerlevel9k


	# POWERLEVEL9k prompt setup
	POWERLEVEL9K_MODE='nerdfont-complete'
	POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$'\ue0b1'
	POWERLEVEL9K_HOME_ICON='\uf015'

	# Context
	DEFAULT_USER="Trevor"
	POWERLEVEL9K_ALWAYS_SHOW_USER=true

	# Colors
	POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='053' #darker magenta
	POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='220' #yellow
	POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='red'
	POWERLEVEL9K_DIR_HOME_BACKGROUND='236' #gray
	POWERLEVEL9K_DIR_HOME_FOREGROUND='250' #light gray
	POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='067' #lighter gray
	POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='139' #even lighter gray-pink
	POWERLEVEL9K_OS_ICON_BACKGROUND='233' #gray
	POWERLEVEL9K_VCS_CLEAN_BACKGROUND='033' #light blue
	POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='124' #red
	POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='214' #yellow'
	POWERLEVEL9K_TIME_BACKGROUND='246' #light gray
	POWERLEVEL9K_HISTORY_BACKGROUND='236' #slightly darker gray
	POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND='235' #darker gray
	POWERLEVEL9K_STATUS_OK_BACKGROUND='234' #even darker gray
	POWERLEVEL9K_STATUS_ERROR_BACKGROUND='052' #darker red
	POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{yellow}╭%F{red}─%F{black}"
	POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{green}╰%F{blue}─[%F{yellow}%#%F{blue}] %F{white}"
	
	# Spacing
	POWERLEVEL9K_PROMPT_ON_NEWLINE=true			#actual prompt is on next line
	POWERLEVEL9K_PROMPT_ADD_NEWLINE=true			#add newline before next prompt
	
	# Element customizations
	POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'			#time format
	POWERLEVEL9K_SHORTEN_DIR_LENGTH=1			#number of directories to leave at end
	POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle" 	#strategy of truncation
	POWERLEVEL9K_SHORTEN_DELIMITER="^"			#truncate delimiter
	POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{052} $(print_icon 'LEFT_SUBSEGMENT_SEPARATOR') %F{black}"
	#POWERLEVEL9K_HOME_FOLDER_ABBREVIATION="%F{blue} $(print_icon 'HOME_ICON') %F{black}"
	
	# Prompt
	POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir dir_writable vcs)
	POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
	
	# Apply Antigen settings
	antigen apply

fi




















#===================================================
#EXPORTS
#===================================================
export PATH=$PATH:/home/trevorbautista/bin:/home/trevorbautista/Homestead/bin
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib64:/usr/lib32"
export VISUAL=vim
export LANG=en_US.UTF-8
export QEMU_AUDIO_DRV=pa


#==================================================
#SETOPTS
#==================================================
#Don't notify when bg processes finish
setopt NO_NOTIFY
#Don't hang up bg processes when exiting
setopt NO_HUP




#=================================================
#ALIASES
#=================================================
alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
alias multimc=multimc5
alias chirp="sudo chirpw"
alias ltspice="/usr/bin/wine '/home/trevorbautista/.wine/drive_c/Program Files/LTspiceXVII/XVIIx64.exe'"
alias su="su-p"
alias sudo="sudo -E"



#================================================
#MISCELLANEOUS
#================================================
#XTERM TRANSPARENCY
#[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

# Laravel Homestead
function homestead() {
	(cd ~/Homestead && vagrant $* )
}

#Add help
autoload -Uz run-help
#unalias run-help
alias help=run-help

#If not running interactively, don't do anything
[[ $- != *i* ]] && return


#print ASCII art
#if [ -f /usr/bin/screenfetch ]; then screenfetch; fi
if [ -f /usr/bin/neofetch ]; then neofetch --config ~/.config/neofetch/config; fi


#===============================================
#KEYBINDING COMPATIBILITY
#===============================================

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="$terminfo[khome]"
key[End]="$terminfo[kend]"
key[Insert]="$terminfo[kich1]"
key[Backspace]="$terminfo[kbs]"
key[Delete]="$terminfo[kdch1]"
key[Up]="$terminfo[kcuu1]"
key[Down]="$terminfo[kcud1]"
key[Left]="$terminfo[kcub1]"
key[Right]="$terminfo[kcuf1]"
key[PageUp]="$terminfo[kpp]"
key[PageDown]="$terminfo[knp]"

# setup key accordingly
[[ -n "$key[Home]"      ]] && bindkey -- "$key[Home]"      beginning-of-line
[[ -n "$key[End]"       ]] && bindkey -- "$key[End]"       end-of-line
[[ -n "$key[Insert]"    ]] && bindkey -- "$key[Insert]"    overwrite-mode
[[ -n "$key[Backspace]" ]] && bindkey -- "$key[Backspace]" backward-delete-char
[[ -n "$key[Delete]"    ]] && bindkey -- "$key[Delete]"    delete-char
[[ -n "$key[Up]"        ]] && bindkey -- "$key[Up]"        up-line-or-history
[[ -n "$key[Down]"      ]] && bindkey -- "$key[Down]"      down-line-or-history
[[ -n "$key[Left]"      ]] && bindkey -- "$key[Left]"      backward-char
[[ -n "$key[Right]"     ]] && bindkey -- "$key[Right]"     forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        echoti smkx
    }
    function zle-line-finish () {
        echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi
