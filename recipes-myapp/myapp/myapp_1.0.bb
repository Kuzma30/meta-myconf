DESCRIPTION = "My Custom Qt App"
AUTHOR = "author@example.org"
LICENSE = "CLOSED"
PR = "r3"

SRC_URI =+ "file://Ferti"

DEPENDS += "qtbase qtdeclarative qtdeclarative-native"

do_install() {
    install -d ${D}/mnt/
    install -d ${D}/mnt/flash/
    install -d ${D}/${bindir}/lib/
    install -m 0755 ${WORKDIR}/Ferti ${D}/${bindir}/lib/Ferti
    ln --relative --symbolic ${D}/${bindir}/lib/Ferti ${D}/${bindir}/b2qt
}

FILES:${PN} += "${bindir}/lib/Ferti \
                ${bindir}/b2qt \
		/mnt/ \
                /mnt/flash/ \
               "
