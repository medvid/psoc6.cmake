project(mtb101)

psoc6_load_application(
  NAME CypressAcademy_MTB101_Files
  TAG  9fb53dc
)
include(app/mtb_02_ex01_smartio_rgb.cmake)
include(app/mtb_02_ex02_pwm_blinkled.cmake)
include(app/mtb_02_ex03_pwm_brightness_control.cmake)
include(app/mtb_02_ex04_timer_hal.cmake)
include(app/mtb_02_ex05_timer_pdl.cmake)
include(app/mtb_02_ex06_counter_dutycycle.cmake)
include(app/mtb_02_ex07_i2c_brightness_control.cmake)
include(app/mtb_02_ex08_spi_master.cmake)
include(app/mtb_02_ex09_uart.cmake)
include(app/mtb_03_ex01_psoc6_capsense_button_linearslider.cmake)
include(app/mtb_03_ex02_psoc6_capsense_gestures_linearslider.cmake)
