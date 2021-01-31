
echo "************ Config System *************"
sleep 3

# 设置镜像源
cp ./mirrorlist /etc/pacman.d/mirrorlist
# 安装基本工具
pacman -S --noconfirm vim

# 设置时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc
# 设置本地语言
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_TW.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_HK.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# 设置网络
echo "yanhaoArch" > /etc/hostname
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1	yanhaoArch.localdomain	yanhaoArch" >> /etc/hosts

# 设置root密码123
echo "Set Root/yanhao Password"
echo -e "123\n123\n" | passwd
# 设置用户密码123
useradd -m -G wheel -s /bin/bash yanhao
echo -e "123\n123\n" | passwd yanhao
chmod 777 /etc/sudoers
sed -i "/root ALL=(ALL) ALL/a\yanhao ALL=(ALL) ALL" /etc/sudoers
chmod 440 /etc/sudoers

