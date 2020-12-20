
echo "************ Install Grub *************"
sleep 5
# 安装配置引导系统
pacman -S grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# 安装软件
./InstallArch_Software.sh

# 配置
./InstallArch_Config.sh