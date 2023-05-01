FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SPLASH_IMAGES:append = " file://splash.png;outsuffix=bar;rotate=cw90;stretch=1"
ALTERNATIVE_PRIORITY:psplash-bar[psplash] = "200"