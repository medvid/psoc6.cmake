/* FreeRTOS includes. */
#include "FreeRTOS.h"
#include "FreeRTOSConfig.h"
#include "task.h"

/* Standard includes. */
#include <stdio.h>
#include <stdarg.h>
#include "cmsis_compiler.h"

__WEAK void vLoggingPrint( const char * pcMessage )
{
    printf( "%s", pcMessage );
    fflush(stdout);
}

__WEAK void vLoggingPrintf( const char * pcFormat, ... )
{
    va_list args;
    va_start( args, pcFormat );
    printf( pcFormat, args);
    va_end( args );
    fflush(stdout);
}

/*-----------------------------------------------------------*/

__WEAK void vApplicationDaemonTaskStartupHook( void )
{
}

/*-----------------------------------------------------------*/

/**
 * @brief User defined Idle task function.
 *
 * @note Do not make any blocking operations in this function.
 */
__WEAK void vApplicationIdleHook( void )
{
    /* FIX ME. If necessary, update to application idle periodic actions. */

    static TickType_t xLastPrint = 0;
    TickType_t xTimeNow;
    const TickType_t xPrintFrequency = pdMS_TO_TICKS( 5000 );

    xTimeNow = xTaskGetTickCount();

    if( ( xTimeNow - xLastPrint ) > xPrintFrequency )
    {
        xLastPrint = xTimeNow;
    }
}

__WEAK void vApplicationTickHook()
{
}

/**
 * @brief User defined assertion call. This function is plugged into configASSERT.
 * See FreeRTOSConfig.h to define configASSERT to something different.
 */
__WEAK void vAssertCalled(const char * pcFile,
    uint32_t ulLine)
{
    /* FIX ME. If necessary, update to applicable assertion routine actions. */

    const uint32_t ulLongSleep = 1000UL;
    volatile uint32_t ulBlockVariable = 0UL;
    volatile char * pcFileName = (volatile char *)pcFile;
    volatile uint32_t ulLineNumber = ulLine;

    (void)pcFileName;
    (void)ulLineNumber;

    printf("vAssertCalled %s, %ld\n", pcFile, (long)ulLine);
    fflush(stdout);

    /* Setting ulBlockVariable to a non-zero value in the debugger will allow
    * this function to be exited. */
    taskDISABLE_INTERRUPTS();
    {
        while (ulBlockVariable == 0UL)
        {
            vTaskDelay( pdMS_TO_TICKS( ulLongSleep ) );
        }
    }
    taskENABLE_INTERRUPTS();
}
/*-----------------------------------------------------------*/

/**
 * @brief Warn user if pvPortMalloc fails.
 *
 * Called if a call to pvPortMalloc() fails because there is insufficient
 * free memory available in the FreeRTOS heap.  pvPortMalloc() is called
 * internally by FreeRTOS API functions that create tasks, queues, software
 * timers, and semaphores.  The size of the FreeRTOS heap is set by the
 * configTOTAL_HEAP_SIZE configuration constant in FreeRTOSConfig.h.
 *
 */
__WEAK void vApplicationMallocFailedHook()
{
    configPRINTF( ( "ERROR: Malloc failed to allocate memory\r\n" ) );
    taskDISABLE_INTERRUPTS();

    /* Loop forever */
    for( ; ; )
    {
    }
}
/*-----------------------------------------------------------*/

/**
 * @brief Loop forever if stack overflow is detected.
 *
 * If configCHECK_FOR_STACK_OVERFLOW is set to 1,
 * this hook provides a location for applications to
 * define a response to a stack overflow.
 *
 * Use this hook to help identify that a stack overflow
 * has occurred.
 *
 */
__WEAK void vApplicationStackOverflowHook( TaskHandle_t xTask,
                                    char * pcTaskName )
{
    configPRINTF( ( "ERROR: stack overflow with task %s\r\n", pcTaskName ) );
    portDISABLE_INTERRUPTS();

    /* Unused Parameters */
    ( void ) xTask;

    /* Loop forever */
    for( ; ; )
    {
    }
}
