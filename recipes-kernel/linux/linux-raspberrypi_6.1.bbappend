FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += " \
	    file://0001-Patch-LT070ME05000.patch \
	    file://defconfig_rt \
	    file://logo_final.ppm \
	    file://patch-6.1.54-rt15.patch \
"
PR = "r2"
unset KBUILD_DEFCONFIG

do_configure:prepend () {
    cp "${WORKDIR}/defconfig_rt" "${B}/.config"  
    cp "${WORKDIR}/logo_final.ppm" "${B}/source/drivers/video/logo/logo_linux_clut224.ppm"
}