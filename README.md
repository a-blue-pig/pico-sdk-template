# pico-sdk-template
This repository works as a project template for the Pi Pico W.

**If NOT using VSCode's `CMake-Tools` extension to configure and build, ensure that you uncomment `.vscode` from `.gitignore`.**
# Usage
## Makefile Functions
This template contains a makefile that automates build and upload to the pico w
on a mac.

Functions include:
```
make build      # builds the targets to a build/ directory
```
```
make serial     # waits for pico to be available on usb and connects
```
```
make upload     # uploads the specified .uf2 file to the pico drive
```
```
make all       # build the project, upload it, and connect to serial
```

## Makefile Configuration
### Computer-Pico Interaction
Specify where the pi pico is accessed when connected in `BOOTSEL` mode.
```
PICO_DRIVE := /Volumes/RPI-RP2
PICO_SERIAL := /dev/tty.usbmodem1101
```
### Pico/Project Settings
Specify the project specific items, such as .uf2 file and board configuration.
```
# Project Specific
PROJECT_FILE := template.uf2

# PICO Configuration
SDK_PATH := PICO_SDK_PATH=../../../pico-sdk
BOARD := PICO_BOARD=pico_w
WIFI:= WIFI_SSID="wifi name"
WIFI_PASS:= WIFI_PASSWORD="password"
```