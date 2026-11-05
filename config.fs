# Vendor Android IDs (AIDs) for the Raspberry Pi 5 device tree, read through TARGET_FS_CONFIG_GEN
# (BoardConfig.mk). The build writes each section into /vendor/etc/group and /vendor/etc/passwd.
#
# vendor_modem owns the SIM7600's USB serial ports (NMEA and AT): ueventd.rpi5.rc gives /dev/ttyUSB* to this
# group, and the car client runs in it through its MODEM_PORTS permission. That permission names the group by
# number, 2900, in carclient-modem-ports.xml in the straight-talk repository (aaos/carclient/), so the value
# below must stay equal to it.

[AID_VENDOR_MODEM]
value: 2900

# vendor_npu owns the AI HAT+ 2's Hailo-10H (/dev/h1x-*): ueventd.rpi5.rc gives the device to this group, and the car
# client runs in it through its NPU permission, which names the group by number, 2901, in carclient-npu.xml in the
# straight-talk repository (aaos/carclient/), so the value below must stay equal to it.

[AID_VENDOR_NPU]
value: 2901
