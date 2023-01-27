# Copyright 2017 Jack Humbert
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# If it's possible that multiple bootloaders can be used for one project,
# you can leave this unset, and the correct size will be selected
# automatically.
#
# Sets the bootloader defined in the keyboard's/keymap's rules.mk
#
# Current options for AVR:
#     halfkay      PJRC Teensy
#     caterina     Pro Micro (Sparkfun/generic)
#     atmel-dfu    Atmel factory DFU
#     lufa-dfu     LUFA DFU
#     qmk-dfu      QMK DFU (LUFA + blinkenlight)
#     qmk-hid      QMK HID (LUFA + blinkenlight)
#     bootloadhid  HIDBootFlash compatible (ATmega32A)
#     usbasploader USBaspLoader (ATmega328P)
#
# If you need to provide your own implementation, you can set inside `rules.mk`
# `BOOTLOADER = custom` -- you'll need to provide your own implementations. See
# the respective file under `platforms/<PLATFORM>/bootloaders/custom.c` to see
# which functions may be overridden.
#
# BOOTLOADER_SIZE can still be defined manually, but it's recommended
# you add any possible configuration to this list

FIRMWARE_FORMAT?=bin

ifeq ($(strip $(BOOTLOADER)), custom)
    OPT_DEFS += -DBOOTLOADER_CUSTOM
    BOOTLOADER_TYPE = custom
endif

ifeq ($(strip $(BOOTLOADER)), md-boot)
    OPT_DEFS += -DBOOTLOADER_MD_BOOT
    BOOTLOADER_TYPE = md_boot
endif
ifeq ($(strip $(BOOTLOADER)), sam-ba)
    OPT_DEFS += -DBOOTLOADER_SAM_BA
    BOOTLOADER_TYPE = sam_ba

    FIRMWARE_FORMAT = uf2
endif
ifeq ($(strip $(BOOTLOADER)), adafruit-nrfutil)
    OPT_DEFS += -DBOOTLOADER_ADA_NRF
    BOOTLOADER_TYPE = adafruit_nrfutil
endif

ifeq ($(strip $(BOOTLOADER_TYPE)),)
    ifneq ($(strip $(BOOTLOADER)),)
        $(call CATASTROPHIC_ERROR,Invalid BOOTLOADER,Invalid bootloader specified. Please set an appropriate bootloader in your rules.mk or info.json.)
    else
        $(call CATASTROPHIC_ERROR,Invalid BOOTLOADER,No bootloader specified. Please set an appropriate bootloader in your rules.mk or info.json.)
    endif
endif
