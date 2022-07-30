DESCRIPTION = "Speech Dispatcher is a high-level device independent layer \
for speech synthesis through a simple, stable and well documented interface."
HOMEPAGE = "https://brailcom.org"
LICENSE = "GPLv2 & GPLv3 & LGPL"
LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
		file://COPYING.GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
		file://COPYING.GPL-3;md5=d32239bcb673463ab874e80d47fae504"

DEPENDS = "espeak flite pulseaudio libdotconf glib-2.0 libtool gettext"
RPROVIDES:${PN} += "speechd"

PR = "r0"

inherit autotools update-rc.d pkgconfig ptest gettext

SRC_URI = "git://github.com/brailcom/speechd.git;branch=master;protocol=https \
           file://speech-dispatcher.init"

SRCREV = "6ed1ba1885db0b5033b65faf6b65e4119938f721"
S = "${WORKDIR}/git"

LEAD_SONAME = "libspeechd.so"
EXTRA_OECONF = " --with-espeak --with-flite --without-ibmtts --without-nas --with-alsa --with-pulse "

INITSCRIPT_NAME = "speech-dispatcher"
INITSCRIPT_PARAMS = "defaults 45"

do_hadd() {

        install -m 0644 ${WORKDIR}/build/src/api/c/libspeechd_version.h ${S}/src/api/c/libspeechd_version.h
}
addtask hadd after do_configure before do_build
do_hadd[nostamp] = "1"
do_install() {
        install -d ${D}${bindir}
        install -d ${D}${includedir}
        install -d ${D}${libdir}/${PN}-modules
	install -d ${D}${sysconfdir}	
	install -d ${D}${sysconfdir}/init.d
	install -d ${D}${sysconfdir}/speech-dispatcher
	install -d ${D}${sysconfdir}/speech-dispatcher/modules

        oe_libinstall -so -C src/modules libbaratinoo ${D}${libdir}
        oe_libinstall -so -C src/modules libKali ${D}${libdir}
        oe_libinstall -so -C src/modules libKAnalyse ${D}${libdir}
        oe_libinstall -so -C src/modules libKGlobal ${D}${libdir}
        oe_libinstall -so -C src/modules libKParle ${D}${libdir}
        oe_libinstall -so -C src/modules libKTrans ${D}${libdir}
        oe_libinstall -so -C src/modules libvoxin ${D}${libdir}
        oe_libinstall -so -C src/modules libbaratinoo ${D}${libdir}

#        oe_libinstall -so -C src/audio spd_alsa ${D}${libdir}
#        oe_libinstall -so -C src/audio spd_oss ${D}${libdir}
#        oe_libinstall -so -C src/audio spd_pulse ${D}${libdir}
        oe_libinstall -so -C src/api/c libspeechd ${D}${libdir}
        
        install -m 0644 ${S}/src/api/c/libspeechd.h    ${D}${includedir}
        install -m 0644 ${S}/src/api/c/libspeechd.h    ${D}${includedir}
        install -m 0755 ${WORKDIR}/build/src/clients/say/.libs/spd-say ${D}${bindir}
        install -m 0755 ${WORKDIR}/build/src/server/speech-dispatcher  ${D}${bindir}
        install -m 0755 ${WORKDIR}/build/src/modules/sd_*   ${D}${libdir}/${PN}-modules/
	
	install -m 0644 ${S}/config/speechd.conf ${D}${sysconfdir}/speech-dispatcher
	install -m 0644 ${S}/config/modules/*.conf ${D}${sysconfdir}/speech-dispatcher/modules
	install -m 0755 ${WORKDIR}/speech-dispatcher.init ${D}${sysconfdir}/init.d/speech-dispatcher
}

do_stage() {
        install -m 0644 ${S}/src/api/c/libspeechd.h ${STAGING_INCDIR}
        oe_libinstall -so -C src/api/c libspeechd ${STAGING_LIBDIR}
}

PACKAGES =+ "libspeechd-dev libspeechd"

FILES:${PN} += "${libdir}/${PN}-modules/*" 
#FILES:${PN}-dbg += "${libdir}/${PN}-modules/.debug" 
FILES:libspeechd += "${libdir}/libspeechd.so.*"
FILES:libspeechd-dev += "${libdir}/libspeechd* ${includedir}"
#FILES:libspeechd-dbg += "${libdir}/.debug/libspeechd*"

SRC_URI[md5sum] = "bbd7ebc5b0f1b3ec4d89ad66b20d5cea"
SRC_URI[sha256sum] = "c664ee801d1bc0500ae75739fa98bcc8ad410474c98a6757d3d1ee24a8241462"
