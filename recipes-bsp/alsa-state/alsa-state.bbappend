FILESEXTRAPATHS:prepend := "${THISDIR}/files/:"

SRC_URI:append = "file://asound-rpi4.conf"

FILES:${PN} += "${sysconfdir} ${datadir}/alsa"

do_install:append() {
    install -d ${D}${sysconfdir}
    # Remove the default asound.conf, we need set up asound.conf dynamically
    rm -f ${D}${sysconfdir}/asound.conf
    install -m 0644 ${WORKDIR}/asound-rpi4.conf ${D}${sysconfdir}
}

# Invalidate the default pkg_postinst in oe-core, this ensures our ontarget
# postinst to be the only one to run during package installation.
pkg_postinst:${PN}() {
}

pkg_postinst:${PN}() {
    mv /etc/asound-rpi4.conf /etc/asound.conf
#    install -m 0644 ${WORKDIR}/asound-rpi4.conf /etc/asound.conf
    rm -f /etc/asound-*.conf
#    rm -f /var/lib/alsa/asound-*.state
}
