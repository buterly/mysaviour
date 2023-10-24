#!/bin/sh
#echo "gtk-application-prefer-dark-theme = true" >> ~/.config/gtk-3.0/settings.install
echo -e "message\nhow"

asker() {

echo Wanna install ${1} "${2:-}"?
printf "[y/n]: "

read consent

case $consent in 
    y)
      echo "Installing $1 ${2:-}..."
      sudo dnf install $1
      echo -e "\n\n"
      ;;
    *)
      echo "Skipping $1"
      echo -e "\n\n"
      ;;
esac
}

installer() {
  echo Installing ${1}...
  sudo dnf install $1
  echo -e "\n\n"
}

blue='\033[34m'

echo "Setting GTK application theme to dark"
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-Dark"

# brightness ctl permissions
installer brightnessctl
sudo chmod +s $(which brightnessctl)

# login screenschanger
installer lightdm
installer lightdm-slick-greeter
installer lightdm-settings
printf "${blue}Change /etc/lightdm/lightdm.conf -> uncomment #greeter-session=lightdm-slick-greeter \n"

printf "${blue}Change login screen wallapaper by \'sudo lightdm-settings\' $(tput sgr0) \n"

installer dmenu

installer dunst

asker nvim
echo Wanna install Nvchad (Nvim plugins)
printf "[y/n]: "

read consent

case $consent in 
    y)
      echo "Installing Nvchad..."
      git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
      echo -e "\n\n"
      ;;
    *)
      echo "Skipping"
      echo -e "\n\n"
      ;;
esac



asker gcc

installer feh

asker git 

asker i3lock

installer network-manager-applet

installer polybar

asker ranger

installer rofi
installer rofimoji

asker eog "(Eye of gnome - image viewer)"

asker tlp "(Performance optiomiser)"

asker xfce4-power-manager
asker xfce4-terminal

installer xclip

