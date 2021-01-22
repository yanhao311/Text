
echo "************ Install Grub *************"
sleep 3
# 安装配置引导系统
pacman -S grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# 配置
./InstallArch_Config.sh

# 安装软件
./InstallArch_Software.sh

