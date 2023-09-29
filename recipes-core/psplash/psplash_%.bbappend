FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

PR = "r5"
SPLASH_IMAGES:append = " file://splash.png;outsuffix=bar;disable_progress_bar=true"
ALTERNATIVE_PRIORITY:psplash-bar[psplash] = "200"