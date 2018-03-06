#
# ~/.zshrc
#

# The following lines were added by compinstall
zstyle :compinstall filename '/home/trevorbautista/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory
bindkey -v
# End of lines configured by zsh-newuser-install

#EXPORT PATH
export PATH=$PATH:/home/trevorbautista/bin:/home/trevorbautista/Homestead/bin
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib64:/usr/lib32"
export VISUAL=vim
export LANG=en_US.UTF-8
export QEMU_AUDIO_DRV=pa

#Don't notify when bg processes finish
setopt NO_NOTIFY
#Don't hang up bg processes when exiting
setopt NO_HUP

#If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Aliases
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#XTERM TRANSPARENCY
[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

# Laravel Homestead
function homestead() {
	(cd ~/Homestead && vagrant $* )
}

#Add help
autoload -Uz run-help
#unalias run-help
alias help=run-help

#Other aliases
alias multimc=multimc5
alias chirp="sudo chirpw"
alias ltspice="/usr/bin/wine '/home/trevorbautista/.wine/drive_c/Program Files/LTspiceXVII/XVIIx64.exe'"

#Set prompt
autoload -Uz promptinit
promptinit
#export PROMPT="%K{yellow}%F{black}▓▒░%F{020}[%n@%m]➜ %K{202}%~%K{yellow}>%#%F{black}░▒▓%K%F{white} "
#export PROMPT="%K{red}%F{black}▓▒░%F{020}[%n@%m]➜ %K{202}%~%K{red}>%#%F{black}░▒▓%K%F{white} "
#export PROMPT=%(!."%K{red}%F{black}▓▒░%F{020}[%n@%m]➜ %K{202}%~%K{red}>%#%F{black}░▒▓%K%F{white} "."%K{yellow}%F{black}▓▒░%F{020}[%n@%m]➜ %K{202}%~%K{yellow}>%#%F{black}░▒▓%K%F{white} ")
#export PROMPT=%(!."%F{red}░▒▓%K{red}%F{020}[%#][%n@%m]➜ %F{red}%K{202}▶%F{020}%K{202}%B%~%b%{$reset_color%}%F{202}▶%{$reset_color%} "."%F{yellow}░▒▓%K{yellow}%F{020}[%#][%n@%m]➜ %F{yellow}%K{202}▶%F{020}%K{202}%B%~%b%{$reset_color%}%F{202}▶%{$reset_color%} ")
export PROMPT=%(!."%F{red}░▒▓%K{red}%F{020}[%#][%n@%m]➜ %F{red}%K{cyan}▶%F{020}%K{cyan}%B%~%b%k%f%F{cyan}▶%k%f "."%F{yellow}░▒▓%K{yellow}%F{020}[%#][%n@%m]➜ %F{yellow}%K{cyan}▶%F{020}%K{cyan}%B%~%b%k%f%F{cyan}▶%k%f ")

#Source git prompt
#/usr/share/git/completion/git-prompt.sh
#PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '

#print ASCII art
#if [ -f /usr/bin/screenfetch ]; then screenfetch; fi
if [ -f /usr/bin/neofetch ]; then neofetch --config ~/.config/neofetch/config; fi

# Keybinding compatibility

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