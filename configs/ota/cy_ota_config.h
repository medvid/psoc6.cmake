/*
 * Copyright 2020 Cypress Semiconductor Corporation
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
 */

/**
 * Cypress OTA API abstracts underlying network and
 * platform support for Over The Air updates.
 *
 *  Customer defines for the OTA library
 *
 **********************************************************************/

#ifndef CY_OTA_CONFIG_H__
#define CY_OTA_CONFIG_H__ 1

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief Initial time for checking for OTA updates
 *
 * This is used to start the timer for the initial OTA update check after calling cy_ota_agent_start().
 */
#define CY_OTA_INITIAL_CHECK_SECS           (10)                /* 10 seconds */

/**
 * @brief Next time for checking for OTA updates
 *
 * This is used to re-start the timer after an OTA update check in the OTA Agent.
 */
#define CY_OTA_NEXT_CHECK_INTERVAL_SECS     (24 * 60 * 60)      /* 1 day between checks */

/**
 * @brief Retry time which checking for OTA updates
 *
 * This is used to re-start the timer after failing to contact the server during an OTA update check.
 */
#define CY_OTA_RETRY_INTERVAL_SECS          (5)                 /* 5 seconds between retries after an error */

/**
 * @brief Length of time to check for downloads
 *
 * OTA Agent wakes up, connects to server, and waits this much time before disconnecting.
 * This allows the OTA Agent to be inactive for long periods of time, only checking for short periods.
 * Use 0x00 to continue checking once started.
 */
#define CY_OTA_CHECK_TIME_SECS              (60 * 10)           /* 10 minutes */

/**
 * @brief Expected maximum download time between each OTA packet arrival
 *
 * This is used check that the download occurs in a reasonable time frame.
 */
#define CY_OTA_PACKET_INTERVAL_SECS         (60)                /* 1 minute */


/**
 * @brief Number of retries when attempting OTA update
 *
 * This is used to determine # retries when attempting an OTA update.
 */
#define CY_OTA_RETRIES                      (5)                /* retry entire process 5 times */

/**
 * @brief Number of retries when attempting to contact the server
 *
 * This is used to determine # retries when connecting to the server during an OTA update check.
 */
#define CY_OTA_CONNECT_RETRIES              (3)                 /* 3 server connect retries  */


/**********************************************************************
 * MQTT Defines
 **********************************************************************/
/**
 * @brief The keep-alive interval for MQTT
 *
 * An MQTT ping request will be sent periodically at this interval.
 */
#define CY_OTA_MQTT_KEEP_ALIVE_SECONDS      (60)                /* 60 second keep-alive */

/**
 * @brief The timeout for MQTT operations.
 */
#define CY_OTA_MQTT_TIMEOUT_MS              (5000)              /* 5 second timeout waiting for MQTT response */


#ifdef __cplusplus
    }
#endif

#endif /* CY_OTA_CONFIG_H__ */
