#!/bin/bash
# Change Materia accent/primary colors

readonly ThemeName="MateriaK"
readonly PrimaryColor="7952B3"
readonly AccentColor="7952B3"
readonly GnomeShellClose="7952B3"

### Some colors
## Material Design palette -> https://material.io/guidelines/style/color.html#color-color-palette
## Fluent Design palette -> https://docs.microsoft.com/en-us/windows/uwp/design/style/color#accent-color
## Debian red = D70A53
## Fedora blue = 3C6EB4
## openSUSE lightgreen = 73BA25
## openSUSE darkgreen = 6DA741
## openSUSE lightcyan = 35B9AB
## openSUSE darkcyan = 00A489
## RedHat red = CC0000
## RedHat lightblue = A3DBE8
## RedHat darkblue = 004153
## SUSE green = 02D35F
## Ubuntu orange = E95420
## Ubuntu purple = 772953
## Ubuntu Budgie blue = 4D90D6
## Ubuntu Budgie red = A34F6D
## Ubuntu Budgie slate = 383C4A
## Ubuntu MATE green = 87A556
## Ubuntu MATE red = DD4814
## GNOME Adwaita beige = E3D1B6
## GNOME Adwaita blue = 4A90D9
## KDE Plasma blue = 3DAEE9
## Windows select blue = CDE4FC
## Windows folder yellow = FFE79B
## MiamiVice bluegreen = 0BD3D3
## MiamiVice pink = F890E7
## Apple website blue = 0070C9
## Bootstrap purple = 7952B3
## Bootstrap yellow = FFE484
## Bootstrap grey = 6C757D
## Bulma green = 00D1B2
## Lamborghini gold = DDB321
## Mozilla MDN blue = 3F87A6
## Mozilla MDN yellow = F6B73C
## OnePlus red = EB0029
## VALVe brown = 745E4E
## VALVe green = D3D6CA
## VALVe orange = CF381E
## Pantone rose quartz = F7CAC9
## Pantone serenity = 92A8D1
## Sherwin taupe = 8C7E78
## Gunmetal = 2C3539
## DarthWound red = A63F3F
## Papirus black = 505050
## Papirus grey = 8D8D8D
## Papirus brown = AE8D6E
## Papirus green = 84B05F
## Papirus teal = 009F85
## Papirus cyan = 00BAD2
## Papirus blue = 4F92DE

sudo rm -rf /usr/share/themes/$ThemeName*

wget -O - https://github.com/nana-4/materia-theme/archive/master.tar.gz | tar xz
cd materia-theme-master

sleep 2s

sed -i "s/Materia/$ThemeName/g" install.sh
sed -i "/Comment/!s/Materia/$ThemeName/g" src/*.theme

sed -i 's/Roboto, "M+ 1c", Cantarell/Cantarell, Roboto, "M+ 1c"/g' src/_sass/gnome-shell/_variables.scss
sed -i 's/"M+ 1c", Roboto, Cantarell/Cantarell, "M+ 1c", Roboto/g' src/_sass/gnome-shell/_variables.scss

sed -i 's/symbolic/regular/g' src/_sass/gnome-shell/_common{-3.18,-3.24,-3.26,-3.28}.scss

sed -i "s/40C4FF/$PrimaryColor/gI" src/_sass/_color-palette.scss
sed -i "s/338DD6/$PrimaryColor/gI" src/_sass/_color-palette.scss
sed -i "s/338DD6/$PrimaryColor/gI" src/_sass/_colors.scss
sed -i "s/338DD6/$PrimaryColor/gI" src/gnome-shell/assets{,-dark}/*.svg
sed -i "s/338DD6/$PrimaryColor/gI" src/gtk/assets.svg
sed -i "s/338DD6/$PrimaryColor/gI" src/gtk-2.0/assets{,-dark}.svg
sed -i "s/338DD6/$PrimaryColor/gI" src/gtk-2.0/gtkrc{,-dark,-light}
sed -i "s/338DD6/$PrimaryColor/gI" src/metacity-1/metacity-theme-2{,-light}.xml
sed -i "s/338DD6/$PrimaryColor/gI" src/metacity-1/metacity-theme-3{,-light}.xml

sed -i "s/009688/$AccentColor/gI" src/_sass/_color-palette.scss
sed -i "s/009688/$AccentColor/gI" src/_sass/_colors.scss
sed -i "s/009688/$AccentColor/gI" src/gnome-shell/assets{,-dark}/*.svg
sed -i "s/009688/$AccentColor/gI" src/gtk/assets.svg
sed -i "s/009688/$AccentColor/gI" src/gtk-2.0/assets{,-dark}.svg
sed -i "s/009688/$AccentColor/gI" src/gtk-2.0/gtkrc{,-dark,-light}
sed -i "s/009688/$AccentColor/gI" src/metacity-1/metacity-theme-2{,-light}.xml
sed -i "s/009688/$AccentColor/gI" src/metacity-1/metacity-theme-3{,-light}.xml

sed -i "s/FF5252/$GnomeShellClose/gI" src/gnome-shell/assets/window-close{,-active}.svg

sleep 2s

./parse-sass.sh
./render-assets.sh

chmod +x install.sh
sudo ./install.sh

sleep 2s

cd ..
rm -rf materia-theme-master

clear
printf "Kolorized! You can change your gtk theme now.\nRestarting your session may be necessary.\n"
read -p "Press ENTER to close."
