#
# Copyright (C) 2021-2022 KonstaKANG
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/brcm/rpi5
KERNEL_PATH := device/brcm/rpi5-kernel

RPI_BOOT_OUT := $(PRODUCT_OUT)/rpiboot
# The kernel is the one the product installed as $(PRODUCT_OUT)/kernel (device.mk copies the stock prebuilt there; a
# product may copy its own first), so a product can carry another kernel without touching this file.
$(RPI_BOOT_OUT): $(INSTALLED_RAMDISK_TARGET) $(PRODUCT_OUT)/kernel
	mkdir -p $(RPI_BOOT_OUT)
	mkdir -p $(RPI_BOOT_OUT)/overlays
	cp $(DEVICE_PATH)/boot/* $(RPI_BOOT_OUT)
	cp $(PRODUCT_OUT)/kernel $(RPI_BOOT_OUT)/Image
	cp $(KERNEL_PATH)/bcm2712*-rpi-*.dtb $(RPI_BOOT_OUT)
	cp $(KERNEL_PATH)/overlays/* $(RPI_BOOT_OUT)/overlays
	cp $(PRODUCT_OUT)/ramdisk.img $(RPI_BOOT_OUT)
	echo $(BOARD_KERNEL_CMDLINE) > $(RPI_BOOT_OUT)/cmdline.txt

$(INSTALLED_BOOTIMAGE_TARGET): $(RPI_BOOT_OUT)
	$(call pretty,"Target boot image: $@")
	dd if=/dev/zero of=$@ bs=1M count=128
	mkfs.fat -F 32 -n "boot" $@
	mcopy -s -i $@ $(RPI_BOOT_OUT)/* ::
