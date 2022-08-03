do_deploy:append:raspberrypi4() {
    echo "# enable support 1024x600 LCD with touchscreen support" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "hdmi_group=2" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "hdmi_mode=87" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "hdmi_cvt 1024 600 60 6 0 0 0" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=spi1-1cs,cs0_spidev=off">> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=ads7846-spi1,cs=0,penirq=26,penirq_pull=2,speed=50000,keep_vref_on=0,swapxy=0,pmax=255,xohms=150,xmin=200,xmax=3900,ymin=200,ymax=3900" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "# enable support for CAN" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=mcp2515-can0,oscillator=8000000,interrupt=25,spimaxfrequency=1000000" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
}
