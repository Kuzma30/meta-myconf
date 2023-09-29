do_deploy:append:raspberrypi4() {
    echo "dtparam=i2c_vc=on" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=i2c-rtc,ds1307,i2c1" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "lcd_ignore=1" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=vc4-kms-v3d,noaudio" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=vc4-kms-dsi-lt070me05000,reset=17,enable=27,dcdc-en=22" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "# Sound configuration" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=max98357a-no-din,sdmode-pin=6" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=i2s-mmap" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "# Enable UART" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=uart3" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=disable-bt" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "# Enable SPI bus" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=spi0-1cs" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=jedec-spi-nor.dtbo,flash-spi0-0=on" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=spi5-2cs,cs0_pin=12,cs1_pin=26,cs0_spidev=off,cs1_spidev=off" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=mcp2515-spi5-can0,oscillator=12000000" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "#dtoverlay=mcp2515-spi5-can1,oscillator=12000000" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=GT911" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=BH1750" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
}