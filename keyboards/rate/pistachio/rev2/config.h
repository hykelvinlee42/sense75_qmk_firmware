/*
Copyright 2020 rate

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#pragma once

#define USE_I2C

/* Split hand configration */
#define SPLIT_HAND_MATRIX_GRID D4,D3

/* ws2812 RGB LED */
#define RGBLIGHT_SPLIT
#define RGBLED_SPLIT { 38, 46 }
#define RGBLED_NUM 84
#define RGBLIGHT_LIMIT_VAL 195
#define RGBLIGHT_LAYERS
#define RGBLIGHT_HUE_STEP 10
#define RGBLIGHT_SAT_STEP 17

#if defined(RGBLIGHT_ENABLE) && !defined(IOS_DEVICE_ENABLE)
  #define USB_MAX_POWER_CONSUMPTION 400
#else
  #define USB_MAX_POWER_CONSUMPTION 100
#endif

/* Mechanical locking support. Use KC_LCAP, KC_LNUM or KC_LSCR instead in keymap */
#define LOCKING_SUPPORT_ENABLE
/* Locking resynchronize hack */
#define LOCKING_RESYNC_ENABLE
