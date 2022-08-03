FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

#COMPATIBLE_MACHINE:imx6sl-warp = "(.)"
#COMPATIBLE_MACHINE:imx6dl-riotboard = "(.)"

SRC_URI:append = " \
		file://ads7846-spi1-overlay.dts"

do_configure:prepend() {
    cp ${WORKDIR}/ads7846-spi1-overlay.dts* ${S}/arch/arm/boot/dts
}
