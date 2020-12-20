
# 设置时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc
# 设置本地语言
sed 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.conf
sed 's/#zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g' /etc/locale.conf
locale-gen
# 设置网络
echo "yanhaoArch" > /etc/hostname
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1	yanhaoArch.localdomain	yanhaoArch" >> /etc/hosts

# 设置root密码
echo "Set Root/yanhao Password"
passwd
# 设置用户密码
useradd -m -G wheel -s /bin/bash yanhao
passwd yanhao
chmod 777 /etc/sudoers
sed -i "/root ALL=(ALL) ALL/a\yanhao ALL=(ALL) ALL" /etc/sudoers
chmod 440 /etc/sudoers