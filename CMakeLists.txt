cmake_minimum_required(VERSION 3.13)
include(pico_sdk_import.cmake)

project(project_name C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
pico_sdk_init()

add_executable(template
        main.c
        )

# enable usb output, disable uart output
pico_enable_stdio_usb(template 1)
pico_enable_stdio_uart(template 0)

# create map/bin/hex file etc.
pico_add_extra_outputs(template)

# pull in common dependencies
target_link_libraries(
        template
        pico_stdlib              # for core functionality
        pico_cyw43_arch_none     # only need Wifi to access the GPIO
        )