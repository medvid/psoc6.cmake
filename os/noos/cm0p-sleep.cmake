project(cm0p-sleep)

psoc6_add_executable(
  SOURCES
    ${PORT_DIR}/cm0p-sleep/main.c
  LINK_LIBRARIES
    mtb-hal-cat1
)
