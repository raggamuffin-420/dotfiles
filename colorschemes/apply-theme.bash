#!/usr/bin/env bash

SELECTED_THEME_FILE="$HOME/.config/colorschemes/simple/green.sch"

# replace theme file path in ~/.Xresources
THEME_PATH_ESCAPED="$(echo \"$SELECTED_THEME_FILE\" | sed 's/\//\\\//g')"
sed -i "s/#include .*\.sch\"$/#include $THEME_PATH_ESCAPED/" $HOME/.Xresources

# update xresource db
xrdb "$HOME/.Xresources"

# update kitty colour scheme
sed -i "s/^foreground #.*$/foreground $(xgetres '*.foreground')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^background #.*$/background $(xgetres '*.tint')/" "$HOME/.config/kitty/kitty.conf"

sed -i "s/^color0 #.*$/color0 $(xgetres '*.color0')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^color8 #.*$/color8 $(xgetres '*.color8')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^color1 #.*$/color1 $(xgetres '*.color1')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^color9 #.*$/color9 $(xgetres '*.color9')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^color2 #.*$/color2 $(xgetres '*.color2')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^color10 #.*$/color10 $(xgetres '*.color10')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^color3 #.*$/color3 $(xgetres '*.color3')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^color11 #.*$/color11 $(xgetres '*.color11')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^color4 #.*$/color4 $(xgetres '*.color4')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^color12 #.*$/color12 $(xgetres '*.color12')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^color5 #.*$/color5 $(xgetres '*.color5')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^color13 #.*$/color13 $(xgetres '*.color13')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^color6 #.*$/color6 $(xgetres '*.color6')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^color14 #.*$/color14 $(xgetres '*.color14')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^color7 #.*$/color7 $(xgetres '*.color7')/" "$HOME/.config/kitty/kitty.conf"
sed -i "s/^color15 #.*$/color15 $(xgetres '*.color15')/" "$HOME/.config/kitty/kitty.conf"

# TODO update zathurarc
# TODO update rofi theme

# restart i3
i3-msg restart

# restart picom
$HOME/.config/picom/scripts/launch.bash 1>/dev/null 2>/dev/null &

# restart polybar
$HOME/.config/polybar/scripts/launch.bash 1>/dev/null 2>/dev/null &
