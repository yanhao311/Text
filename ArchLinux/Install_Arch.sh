
# 准备工作： 
# 1. 检查网络是否正常（无线网络通过wifi-menu命令进行扫描和连接）
# 2. 安装git工具，下载此文件
#   1）pacman -Sy git
#   2）git config --global user.name "yanhao311"
#   3）git config --global user.email "yanhao311@126.com"
#   3) git clone https://github.com/yanhao311/Text.git
# 3. 检查磁盘是否为256GB，磁盘名称是否为sda：  fdisk -l
#    使用fdisk命令删除所有的磁盘分区
#    如果不需要分区，那么


# 更新系统时间
timedatectl set-ntp true

echo "************ Deal With Disk*************"
sleep 5
# 默认磁盘256GB，磁盘名称sda
objDisk=/dev/sda
# 分配swap（2048为FirstSector, swap划分8GB=(16779263-2947)*512）
echo -e "n\np\n1\n2048\n16779263\nw\n" | fdisk $objDisk
# 分配配系统磁盘
echo -e "n\np\n2\n\n\nw\n" | fdisk $objDisk
# 格式化磁盘
mkswap /dev/sda1
mkfs.ext4 /dev/sda2
# 挂载
mount /dev/sda2 /mnt
# 启动交换分区
swapon /dev/sda1


echo "************ Install System*************"
sleep 5
# 变更镜像源
cp ./mirrorlist /etc/pacman.d/mirrorlist
# 同步本地数据
pacman -Syy
# 安装 base 软件包和 Linux 内核以及常规硬件的固件
pacstrap /mnt base base-devel linux linux-firmware

# 配置系统
echo "************ Config System*************"
sleep 5
genfstab -U /mnt >> /mnt/etc/fstab

# 进入新系统
echo "************ Enter System*************"
sleep 5
arch-chroot /mnt
# 设置时区
echo "************ SetTime *************"
sleep 5
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc
# 设置本地语言（首次安装后补充）
# 设置网络
# 设置root密码
echo "************ SetPassword *************"
sleep 5
echo "\n\n\n Set Root Password\n\n"
passwd

echo "************ Install Grub *************"
sleep 5
# 安装配置引导系统
pacman -S grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg


echo "************ Install Software *************"
sleep 5
# 安装git，并配置
pacman -Sy git
git config --global user.name "yanhao311"
git config --global user.email "yanhao311@126.com"
git config --global core.quotepath false

# 退出新系统
exit
# 卸载
umount -R /mnt
# 关机
echo "/n/n/n Install Complete, System will shutdown in 5sec"
for Cnt in {3...0};do
    echo $Cnt
    sleep 1
done
shutdown -h now

