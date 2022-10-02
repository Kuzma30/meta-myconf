FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += " \
	    file://GT911.dts \
	    file://max98357a-no-din.dts \
	    file://mcp2515-spi5-can0.dts \
	    file://mcp2515-spi5-can1.dts \
	    file://noeth.dts \
	    "

RPI_KERNEL_DEVICETREE_OVERLAYS:append = " overlays/GT911.dtbo "
RPI_KERNEL_DEVICETREE_OVERLAYS:append = " overlays/noeth.dtbo "
RPI_KERNEL_DEVICETREE_OVERLAYS:append = " overlays/max98357a-no-din.dtbo "
RPI_KERNEL_DEVICETREE_OVERLAYS:append = " overlays/mcp2515-spi5-can0.dtbo "
RPI_KERNEL_DEVICETREE_OVERLAYS:append = " overlays/mcp2515-spi5-can1.dtbo "

do_compile:prepend() {
  sed -i '/dtbo-$(CONFIG_ARCH_BCM2835) += \\/a GT911.dtbo \\' ${S}/arch/${ARCH}/boot/dts/overlays/Makefile
  cp ${WORKDIR}/GT911.dts ${S}/arch/${ARCH}/boot/dts/overlays/
  sed -i '/dtbo-$(CONFIG_ARCH_BCM2835) += \\/a max98357a-no-din.dtbo \\' ${S}/arch/${ARCH}/boot/dts/overlays/Makefile
  cp ${WORKDIR}/max98357a-no-din.dts ${S}/arch/${ARCH}/boot/dts/overlays/
  sed -i '/dtbo-$(CONFIG_ARCH_BCM2835) += \\/a mcp2515-spi5-can0.dtbo \\' ${S}/arch/${ARCH}/boot/dts/overlays/Makefile
  cp ${WORKDIR}/mcp2515-spi5-can0.dts ${S}/arch/${ARCH}/boot/dts/overlays/
  sed -i '/dtbo-$(CONFIG_ARCH_BCM2835) += \\/a mcp2515-spi5-can1.dtbo \\' ${S}/arch/${ARCH}/boot/dts/overlays/Makefile
  cp ${WORKDIR}/mcp2515-spi5-can1.dts ${S}/arch/${ARCH}/boot/dts/overlays/
  sed -i '/dtbo-$(CONFIG_ARCH_BCM2835) += \\/a noeth.dtbo \\' ${S}/arch/${ARCH}/boot/dts/overlays/Makefile
  cp ${WORKDIR}/noeth.dts ${S}/arch/${ARCH}/boot/dts/overlays/

}