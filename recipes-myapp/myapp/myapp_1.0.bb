DESCRIPTION = "My Custom Qt App"
AUTHOR = "author@example.org"
LICENSE = "CLOSED"
PR = "r1"

SRC_URI =+ "file://myapp \
            file://myapp.service \
           "

inherit systemd

DEPENDS += "qtbase qtdeclarative qtdeclarative-native"

do_install() {
    install -d ${D}/${bindir}
    install -m 0755 ${WORKDIR}/myapp ${D}/${bindir}/myapp

    ln -s -r ${D}/${bindir}/myapp ${D}/${bindir}/b2qt

    install -m 0755 -d ${D}${systemd_unitdir}/system
    install -m 0644 ${WORKDIR}/myapp.service ${D}${systemd_unitdir}/system/
}

FILES_${PN} = "${bindir}/myapp \
               ${bindir}/b2qt \
              "
SYSTEMD_SERVICE:${PN} = "myapp.service"