.PHONY: build

# Computer Specific
PICO_DRIVE := /Volumes/RPI-RP2
PICO_SERIAL := /dev/tty.usbmodem1101

# Project Specific
PROJECT_FILE := template.uf2

# PICO Configuration
SDK_PATH := PICO_SDK_PATH=../../../pico-sdk
BOARD := PICO_BOARD=pico_w
# WIFI:= WIFI_SSID="wifi name"
# WIFI_PASS:= WIFI_PASSWORD="password"
CMAKE_ARGS := -D$(SDK_PATH) -D$(BOARD) # -D$(WIFI) -D$(WIFI_PASS)

build_dir:
	@if [ ! -d build ]; \
	then mkdir build; \
	fi

build: build_dir
	cd build && \
	cmake $(CMAKE_ARGS) .. && \
	make -j

upload:
	@echo --------------------------
	@if [ -d $(PICO_DRIVE) ]; then \
	echo pico detected!; \
	cd build && cp $(PROJECT_FILE) $(PICO_DRIVE); \
	echo File uploaded to pico!; \
	else echo pico not detected; \
	echo skipping upload; \
	fi
	

serial: 
	@echo --------------------------
	@echo waiting for pico serial...;
	@while [ ! -e $(PICO_SERIAL) ]; do \
		sleep 0.1; \
	done
	@echo pico detected!
	@echo connecting...
	@screen $(PICO_SERIAL)

all: build upload serial
	
clean:
	rm -rf build
