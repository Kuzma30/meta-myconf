DESCRIPTION = " dot.conf is an easy to use and powerful configuration file parser library"
HOMEPAGE = "http://www.azzit.de/dotconf/"
LICENSE = "LGPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=155b66f2dc258f05886f9886a60fd870"
inherit autotools
PR = "r0"

SRC_URI = "git://github.com/williamh/dotconf.git;branch=master;protocol=https"
SRCREV = "651d87f20fa647139b8f969577d0391266d53288"

S = "${WORKDIR}/git"
PARALLEL_MAKE = ""

do_install() {
        install -d ${D}${libdir}
        install -d ${D}${includedir}

        install -m 0644 ${S}/src/dotconf.h  ${D}${includedir}

        install -d ${D}/${libdir}/pkgconfig
        install -m 0644 ${B}/dotconf.pc ${D}/${libdir}/pkgconfig/

        oe_libinstall -C src -so libdotconf ${D}${libdir}
}

PACKAGES =+ "dotconf"

