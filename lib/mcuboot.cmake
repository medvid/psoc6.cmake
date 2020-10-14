psoc6_load_library(
  NAME mcuboot
  URL  https://github.com/JuulLabs-OSS/mcuboot
  TAG  v1.5.0-cypress
)

set(MCUBOOT_SOURCES
  ${MCUBOOT_DIR}/boot/bootutil/include/bootutil/bench.h
  ${MCUBOOT_DIR}/boot/bootutil/include/bootutil/boot_record.h
  ${MCUBOOT_DIR}/boot/bootutil/include/bootutil/boot_status.h
  ${MCUBOOT_DIR}/boot/bootutil/include/bootutil/bootutil.h
  ${MCUBOOT_DIR}/boot/bootutil/include/bootutil/bootutil_log.h
  ${MCUBOOT_DIR}/boot/bootutil/include/bootutil/bootutil_test.h
  ${MCUBOOT_DIR}/boot/bootutil/include/bootutil/caps.h
  ${MCUBOOT_DIR}/boot/bootutil/include/bootutil/enc_key.h
  ${MCUBOOT_DIR}/boot/bootutil/include/bootutil/ignore.h
  ${MCUBOOT_DIR}/boot/bootutil/include/bootutil/image.h
  ${MCUBOOT_DIR}/boot/bootutil/include/bootutil/security_cnt.h
  ${MCUBOOT_DIR}/boot/bootutil/include/bootutil/sha256.h
  ${MCUBOOT_DIR}/boot/bootutil/include/bootutil/sign_key.h
  ${MCUBOOT_DIR}/boot/bootutil/src/boot_record.c
  ${MCUBOOT_DIR}/boot/bootutil/src/bootutil_misc.c
  ${MCUBOOT_DIR}/boot/bootutil/src/bootutil_priv.h
  ${MCUBOOT_DIR}/boot/bootutil/src/caps.c
  ${MCUBOOT_DIR}/boot/bootutil/src/encrypted.c
  ${MCUBOOT_DIR}/boot/bootutil/src/image_ec.c
  ${MCUBOOT_DIR}/boot/bootutil/src/image_ec256.c
  ${MCUBOOT_DIR}/boot/bootutil/src/image_ed25519.c
  ${MCUBOOT_DIR}/boot/bootutil/src/image_rsa.c
  ${MCUBOOT_DIR}/boot/bootutil/src/image_validate.c
  ${MCUBOOT_DIR}/boot/bootutil/src/loader.c
  ${MCUBOOT_DIR}/boot/bootutil/src/swap_misc.c
  ${MCUBOOT_DIR}/boot/bootutil/src/swap_move.c
  ${MCUBOOT_DIR}/boot/bootutil/src/swap_priv.h
  ${MCUBOOT_DIR}/boot/bootutil/src/swap_scratch.c
  ${MCUBOOT_DIR}/boot/bootutil/src/tlv.c
)
set(MCUBOOT_INCLUDE_DIRS
  ${MCUBOOT_DIR}/boot/bootutil/include
  ${MCUBOOT_DIR}/boot/cypress/MCUBootApp
  ${MCUBOOT_DIR}/boot/cypress/cy_flash_pal/include
  ${CMAKE_SOURCE_DIR}/configs
)
set(MCUBOOT_LINK_LIBRARIES
  mtb-pdl-cat1
  mbedtls
)

add_library(mcuboot STATIC EXCLUDE_FROM_ALL ${MCUBOOT_SOURCES})
target_include_directories(mcuboot PUBLIC ${MCUBOOT_INCLUDE_DIRS})
target_link_libraries(mcuboot PUBLIC ${MCUBOOT_LINK_LIBRARIES})
