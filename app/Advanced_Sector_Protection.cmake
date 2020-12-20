# This recipe is included from app/community.cmake
# APP_DIR points to the top-level repo directory

psoc6_add_executable(
  NAME
    Advanced_Sector_Protection
  SOURCES
    ${APP_DIR}/memory_interfacing/Advanced_Sector_Protection/main.c
    ${APP_DIR}/memory_interfacing/Advanced_Sector_Protection/Functions.h
    ${APP_DIR}/memory_interfacing/Advanced_Sector_Protection/Functions.c
  LINK_LIBRARIES
    mtb-hal-cat1
    retarget-io
    serial-flash
)
