# 基本工具
pacman -S --noconfirm sed vim

# 网络管理器
pacman -S --noconfirm dhcp networkmanager iproute2
sudo systemctl enable NetworkManager

# 声卡驱动
pacman -S alsa-utils
# 显卡驱动
pacman -S alsa-utils

# 桌面环境
pacman -S --noconfirm xorg xorg-xrandr deepin
sed 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-deepin-greeter/g' /etc/lightdm/lightdm.conf
systemctl enable lightdm
# 配置分辨率
echo "xrandr --newmode \"1920x1080_60.00\" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync" >> /etc/profile
echo "xrandr --addmode Virtual-1 \"1920x1080_60.00\"" >> /etc/profile

# 命令行工具
pacman -S --noconfirm deepin-terminal

# 安装配置git
pacman -S --noconfirm git
git config --global user.name "yanhao311"
git config --global user.email "yanhao311@126.com"
git config --global core.quotepath false