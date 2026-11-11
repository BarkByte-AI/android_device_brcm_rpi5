# The Pi 5's Waveshare 15.6-inch touchscreen (ILITEK ILITEK-TP, USB 222a:0001), mounted upside down so its cables
# leave on the passenger's side. BoardConfig.mk's video=HDMI-A-1:panel_orientation=upside_down gives the HDMI connector
# a panel orientation, which drm_hwcomposer reports to SurfaceFlinger as the display's physical orientation (ROT_180);
# touch does not follow it, so without this a finger lands where the unturned panel would have it. As the Tablet's
# sec_touchscreen.idc (straight-talk aaos/product/gts7l): touch.orientation equals the panel's install orientation.
# Change both together.
touch.deviceType = touchScreen
touch.orientationAware = 1
touch.orientation = ORIENTATION_180
