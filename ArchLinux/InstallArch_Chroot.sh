
echo "************ Install Grub *************"
sleep 5
# 安装配置引导系统
pacman -S grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# 设置root密码
echo "************ SetPassword *************"
sleep 5
echo "/n/n\n Set Root Password\n\n"
passwd

# 退出新系统
exit


# 设置时区
# echo "************ SetTime *************"
# sleep 5
# ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# hwclock --systohc --utc
# 设置本地语言（首次安装后补充）
# 设置网络

# echo "************ Install Software *************"
# sleep 5
# 安装git，并配置
# pacman -Sy git
# git config --global user.name "yanhao311"
# git config --global user.email "yanhao311@126.com"
# git config --global core.quotepath false



