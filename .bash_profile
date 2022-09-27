# /etc/skel/.bash_profile

[[ -f ~/.profile ]] && source ~/.profile
[[ -f ~/.bashrc ]] && source ~/.bashrc

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.


if shopt -q login_shell; then
    [[ -t 0 && $(tty) == /dev/tty1 && ! $DISPLAY ]] && {
    exec startx $XINITRC -nolisten tcp :0 -- vt1 1>|~/.local/share/xorg/xsession-errors 2>&1
    }
else
    exit 1 # Somehow this is a non-bash or non-login shell.
fi
