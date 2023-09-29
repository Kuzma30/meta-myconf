https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/6.1/  RT patch

I create linux-raspberrypi_5.15.bbappend and add
SRC_URI += " \
           file://patch-5.15.86-rt56.patch \
           file://rt.cfg \
           "
in rt.cfg I put
CONFIG_PREEMPT_RT=y

with new line at the end

Збірка дистибутиву

export MACHINE=raspberrypi4
source ./setup-environment.sh 
bitbake b2qt-embedded-qt6-image

Перемкнути перемичку BOOT, підключити плату до USB typeC.
cd usbboot
sudo ./rpiboot
Відмонтувати диски що з'явилися
sudo bmaptool copy b2qt-embedded-qt6-image-raspberrypi4.wic.bz2 --bmap b2qt-embedded-qt6-image-raspberrypi4.wic.bmap /dev/sdb
Відмонтувати диски
Вимкнути плату
Повернути перемичку BOOT на попередне місце.
Можна включати.


На системі - вимкнення синхронізації часу по мережі
sudo systemctl stop systemd-timesyncd
sudo systemctl disable systemd-timesyncd


appcontroller --make-default <path>

Where <path> is the install path of your application binary on the device.

To remove your application from the default startup, run the following command on the device:

appcontroller --remove-default


scp [source file] [username]@[destination server]:.
