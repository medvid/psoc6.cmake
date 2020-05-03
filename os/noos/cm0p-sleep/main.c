/***************************************************************************//**
* \file main.c
* \version 1.0
*
* \brief
*  This is a CM0+ main() template. It enables interrupts, starts the CM4 core,
*  and enters deep-sleep mode.
*
********************************************************************************
* \copyright
* Copyright 2017-2019 Cypress Semiconductor Corporation
* SPDX-License-Identifier: Apache-2.0
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*******************************************************************************/

#include "cy_device_headers.h"
#include "cy_syslib.h"
#include "cy_syspm.h"
#include <stddef.h>

/* Make sure the CM0+ image knows where to find the address of the CM4 application's
 * vector table, so the CM4 core can be started properly.
 *
 * This needs to match the flash base address from the CM4 application's linker script.
 *
 * CY_CORTEX_M4_APPL_ADDR is the default address of the CM4 vector table (8k beyond the
 * start of flash, to leave just enough room for the default (Crypto disabled) CM0+
 * image.
 */
#define CM4_APP_VECTOR_ADDR CY_CORTEX_M4_APPL_ADDR

int main(void)
{
    /* enable interrupts, and the CM4 */
    __enable_irq();
    Cy_SysEnableCM4(CM4_APP_VECTOR_ADDR);

    for (;;)
    {
        Cy_SysPm_DeepSleep( CY_SYSPM_WAIT_FOR_INTERRUPT );
    }
}
