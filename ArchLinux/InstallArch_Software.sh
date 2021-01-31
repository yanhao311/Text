

echo "************ Install Software *************"
sleep 3

# 安装基本工具
pacman -S --noconfirm vim

# 安装并配置网络管理器
pacman -S --noconfirm dhcp networkmanager iproute2
sudo systemctl enable NetworkManager

# 安装并配置声卡驱动
pacman -S --noconfirm alsa-utils
# 安装并配置显卡驱动
pacman -S --noconfirm xf86-video-vesa

# 中文字体
pacman -S --noconfirm wqy-zenhei

# KDE桌面环境
pacman -S --noconfirm xorg xorg-xrandr plasma plasma-wayland-session
systemctl enable sddm.service
# 基本软件
pacman -S --noconfirm dolphin konsole
# 配置分辨率(显卡控制器选择VBoxSVGA，安装增强功能，下面两行可不配)
echo "xrandr --newmode \"1920x1080_60.00\" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync" >> /etc/profile
echo "xrandr --addmode Virtual-1 \"1920x1080_60.00\"" >> /etc/profile

# 安装配置git
pacman -S --noconfirm git
git config --global user.name "yanhao311"
git config --global user.email "yanhao311@126.com"
git config --global core.quotepath false
mkdir /home/yanhao/.ssh
cp ./id_rsa /home/yanhao/.ssh/id_rsa

# 添加archlinuxcn源
echo "[archlinuxcn]" >> /etc/pacman.conf
echo "SigLevel = Optional TrustAll" >> /etc/pacman.conf
echo "Server = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf
pacman -Sy
pacman -S --noconfirm archlinuxcn-keyring

# 安装google浏览器
pacman -S --noconfirm google-chrome

# 安装中文输入法
# pacman -S --noconfirm fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki
# echo "INPUT_METHOD  DEFAULT=fcitx5" >> /home/yanhao/.pam_environment
# echo "GTK_IM_MODULE DEFAULT=fcitx5" >> /home/yanhao/.pam_environment
# echo "QT_IM_MODULE  DEFAULT=fcitx5" >> /home/yanhao/.pam_environment
# echo "SDL_IM_MODULE DEFAULT=fcitx5" >> /home/yanhao/.pam_environment
# echo "XMODIFIERS    DEFAULT=@im=fcitx5" >> /home/yanhao/.pam_environment