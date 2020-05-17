/* This hack enables usage of standard BSP startup (startup_psoc6_xx_cm4.S)
 * with the mbed_boot_gcc_arm.c that expects software_init_hook as en entry point.
 * TODO: check if applicable to ARM and IAR toolchains.
 */

#include "cmsis_compiler.h"

void __libc_init_array(void);

__NO_RETURN void software_init_hook(void);

__NO_RETURN void cy_toolchain_init(void)
{
    // Call static constructors
    __libc_init_array();

    // Starts RTOS, never returns
    software_init_hook();
}
