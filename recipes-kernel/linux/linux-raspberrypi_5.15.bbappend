FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI += " \
	    file://GT911.dts \
	    file://max98357a-no-din.dts \
	    file://mcp2515-spi5-can0.dts \
	    file://0001-Patch-LT070ME05000.patch \
	    file://patch-5.15.92-rt57.patch \
	    file://defconfig"
PR = "r11"
RPI_KERNEL_DEVICETREE_OVERLAYS:append = " overlays/GT911.dtbo "
RPI_KERNEL_DEVICETREE_OVERLAYS:append = " overlays/max98357a-no-din.dtbo "
RPI_KERNEL_DEVICETREE_OVERLAYS:append = " overlays/mcp2515-spi5-can0.dtbo "

do_compile:prepend() {
  sed -i '/dtbo-$(CONFIG_ARCH_BCM2835) += \\/a GT911.dtbo \\' ${S}/arch/${ARCH}/boot/dts/overlays/Makefile
  cp ${WORKDIR}/GT911.dts ${S}/arch/${ARCH}/boot/dts/overlays/
  sed -i '/dtbo-$(CONFIG_ARCH_BCM2835) += \\/a max98357a-no-din.dtbo \\' ${S}/arch/${ARCH}/boot/dts/overlays/Makefile
  cp ${WORKDIR}/max98357a-no-din.dts ${S}/arch/${ARCH}/boot/dts/overlays/
  sed -i '/dtbo-$(CONFIG_ARCH_BCM2835) += \\/a mcp2515-spi5-can0.dtbo \\' ${S}/arch/${ARCH}/boot/dts/overlays/Makefile
  cp ${WORKDIR}/mcp2515-spi5-can0.dts ${S}/arch/${ARCH}/boot/dts/overlays/

}
unset KBUILD_DEFCONFIG

do_configure:prepend () {
    cp "${WORKDIR}/defconfig" "${B}/.config"  
}