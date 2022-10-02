HOMEPAGE = "http://bytesex.org/fbi.html"
DESCRIPTION = "frame buffer image viewer"
DEPENDS = "jpeg"

LICENSE = "COPYING"
LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"

SRC_URI = "http://dl.bytesex.org/releases/fbida/fbi_${PV}.tar.gz"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-${PV}:"
S = "${WORKDIR}/fbi-${PV}"

inherit autotools-brokensep

PARALLEL_MAKE = ""

CFLAGS:append = " ${LDFLAGS}"
TARGET_CC_ARCH += "${LDFLAGS}"
EXTRA_OECONF = "--disable-magick --without-x"

SRC_URI[md5sum] = "0f6c0423098c6a9b28a464df9fab7f39"
SRC_URI[sha256sum] = "0c2e26be3f0cdf7b8b5d33d308acca4b177f6e22ad65592984c5488af6a0a573"
