# Set custom console
CMDLINE_SERIAL = "console=ttyAMA1,115200"
# Disable rpi logo on boot
CMDLINE_LOGO = "logo.nologo consoleblank=0 loglevel=1 quiet"
CMDLINE_PITFT = "fbcon=map:10 fbcon=font:VGA8x8 video=DSI-1:1200x1920M@60,rotate=90"
