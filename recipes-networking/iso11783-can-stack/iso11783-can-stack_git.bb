DESCRIPTION = "ISO 11783 CAN Stack \
An MIT licensed, hardware agnostic, control-function-focused implementation \
of the major ISOBUS (ISO 11783) and SAE J1939 protocols in C++"
HOMEPAGE = "www.delgrossoengineering.com"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=e5005f01f3b0cb442132de3b5c53d903"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
DEPENDS = "libsocketcan"
RPROVIDES:${PN} += "Isobus SocketCANInterface"

PR = "r0"

inherit cmake

EXTRA_OECMAKE = ""

PARALLEL_MAKE = ""

CFLAGS:append = " ${LDFLAGS}"
TARGET_CC_ARCH += "${LDFLAGS}"


SRC_URI = "git://github.com/ad3154/ISO11783-CAN-Stack.git;branch=main;protocol=https\
	file://CMakeLists.txt"

SRCREV = "6a31c657e1606f4160f0873ce6af23b0842426f4"
S = "${WORKDIR}/git"

do_configure:prepend() {
    install -m 0644 ${THISDIR}/files/CMakeLists.txt    ${S}
#    ${bindir}/env unzip -q -o ${THISDIR}/files/google-test.zip -d ${S}
}
do_install() {
    install -d ${D}${bindir}
    install -m 0755 -d ${D}${libdir}
    
    install -m 0755 ${WORKDIR}/build/isobus/libIsobus.so ${D}${libdir}
    install -m 0755 ${WORKDIR}/build/socket_can/libSocketCANInterface.so ${D}${libdir}
    install -m 0755 ${WORKDIR}/build/utility/libSystemTiming.so ${D}${libdir}

#    install -m 0755 ${WORKDIR}/build/isobus/*.so libSocketCANInterface   ${D}${libdir}
#    install -m 0755 ${WORKDIR}/build/socket_can/*.so ${D}${libdir}
#    install -m 0755 ${WORKDIR}/build/utility/*.so    ${D}${libdir}

    install -m 0755 ${WORKDIR}/build/examples/diagnostic_protocol/DiagnosticProtocolExampleTarget   ${D}${bindir}
    install -m 0755 ${WORKDIR}/build/examples/transport_layer/TransportLayerExampleTarget    ${D}${bindir}
    install -m 0755 ${WORKDIR}/build/examples/vt_version_3_object_pool/VT3ExampleTarget    ${D}${bindir}
}
FILES_SOLIBSDEV = ""
INSANE_SKIP:${PN}-dev += "dev-so"

FILES:${PN} += "${libdir}/*"
FILES:${PN} += "/usr/ISOBUS/include/*"
#FILES:${PN}-dev = "${libdir}/* ${includedir}"

PACKAGES =+ "Isobus SocketCANInterface"