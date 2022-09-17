FILESEXTRAPATHS:prepend:= "${THISDIR}/${PN}:"

SRC_URI += " \
   file://raspberrypi4-64_asound.conf \
   "


do_install:append:raspberrypi4-64() {

    echo "    raspberrypi4-64"
    echo "    installing ${WORKDIR}/raspberrypi4-64_asound.conf to ${D}${sysconfdir}/asound.conf"
    install -m 644 ${WORKDIR}/raspberrypi4-64_asound.conf ${D}${sysconfdir}/asound.conf
}