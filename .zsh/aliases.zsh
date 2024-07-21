autoload -Uz compinit && compinit

globalias() {
  local word=${${(Az)LBUFFER}[-1]}

  [[ $GLOBALIAS_FILTER_VALUES[(Ie)$word] -eq 0 ]] && {
    zle _expand_alias
    zle expand-word
  }

  zle self-insert
}

zle -N globalias
bindkey " " globalias
bindkey -M isearch " " magic-space

# navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias scripts='cd ~/.local/bin'
alias conf='cd ~/.config'
alias home='cd ~'
alias dl='cd ~/Downloads'
alias st='cd ~/storage'



# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'


# vim and emacs
alias vim="nvim"

# pacman and yay
alias pacsyu='sudo aura -Syu'                 # update only standard pkgs
alias aurup='sudo aura -Au --noconfirm'              # update only AUR pkgs (yay)
alias asearch='sudo aura -As '             # update standard pkgs and AUR pkgs (yay)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'  # remove orphaned packages

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
# ssh-agent
alias agent='eval $(ssh-agent) && ssh-add'
# youtube-dlp
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "
alias ytv-main="yt-dlp -f 137+140 "

# switch between shells
# I do not recommend switching default SHELL from bash.
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"


# bare git repo alias for dotfiles
alias scripts="/usr/bin/git --git-dir=/home/darnell/git/scripts --work-tree=$HOME"
alias dots="/usr/bin/git --git-dir=/home/darnell/git/dotfiles --work-tree=$HOME"
alias ans="/usr/bin/git --git-dir=/home/darnell/git/ansible --work-tree=$HOME"
alias lab="/usr/bin/git --git-dir=/home/darnell/git/lab --work-tree=$HOME"
alias py="/usr/bin/git --git-dir=/home/darnell/git/python --work-tree=$HOME"


#arcolinux applications
alias att="archlinux-tweak-tool"
alias adt="archlinux-desktop-trasher"


alias nlightdm="sudo $EDITOR /etc/lightdm/lightdm.conf"
alias npacman="sudo $EDITOR /etc/pacman.conf"
alias ngrub="sudo $EDITOR /etc/default/grub"
alias nconfgrub="sudo $EDITOR /boot/grub/grub.cfg"
alias nmkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias nmirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias narcomirrorlist='sudo nano /etc/pacman.d/arcolinux-mirrorlist'
alias nsddm="sudo $EDITOR /etc/sddm.conf"
alias nfstab="sudo $EDITOR /etc/fstab"
alias nnsswitch="sudo $EDITOR /etc/nsswitch.conf"
alias nsamba="sudo $EDITOR /etc/samba/smb.conf"
alias ngnupgconf="sudo $EDITOR /etc/pacman.d/gnupg/gpg.conf"
alias nb="$EDITOR ~/.bashrc"
alias nz="$EDITOR ~/.zshrc"

#switch between lightdm and sddm
alias tolightdm="sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm --needed ; sudo systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
alias tosddm="sudo pacman -S sddm --noconfirm --needed ; sudo systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"

#remove
alias rmgitcache="rm -r ~/.cache/git"

#moving your personal files and folders from /personal to ~
alias personal='cp -Rf /personal/* ~'


GLOBALIAS_FILTER_VALUES=(
  pacman yay dload cl cd.. grep ls ll tree cat vi
)
