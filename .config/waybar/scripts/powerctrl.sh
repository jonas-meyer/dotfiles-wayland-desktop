#!/bin/bash
case $(wofi -d -L 6 -l 3 -W 100 -x -100 -y 10 \
    -D dynamic_lines=false  << EOF | sed 's/^ *//'
    Lock
    Shutdown
    Reboot
    Log off
    Reboot to Windows
    Cancel
EOF
) in
    "Shutdown")
        systemctl poweroff
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Lock")
        swaylock -f
        ;;
    "Log off")
        swaymsg exit
        ;;
    "Reboot to Windows")
        systemctl reboot --boot-loader-entry=auto-windows
        ;;
esac
