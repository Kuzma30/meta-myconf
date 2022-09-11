FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SPLASH_IMAGES:append = " file://splash.png;outsuffix=bar"
ALTERNATIVE_PRIORITY:psplash-bar[psplash] = "200"