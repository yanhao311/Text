
echo "************ Install Grub *************"
sleep 3
# 安装配置引导系统
pacman -S --noconfirm grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# 配置
/home/InstallScript/InstallArch_Config.sh

# 安装软件
/home/InstallScript/InstallArch_Software.sh