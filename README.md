# CMake based build system for PSoC 6 designs

## Prerequisites

* ModusToolbox 2.1
* CMake >= 3.16
* Ninja build system

### Install Windows

1. Download and install ModusToolbox 2.1:

    [https://www.cypress.com/ModusToolboxForWindows][ModusToolboxForWindows]

2. Download and install the latest Git for Windows:

    https://git-scm.com/download/win

3. Download and install the latest CMake win64-x64 Installer:

    https://cmake.org/download/

4. Download Ninja executable, add to user PATH:

    https://github.com/ninja-build/ninja/releases

    CLI example: to install Ninja 1.10.0 to %LOCALAPPDATA%\Programs\Ninja, execute the below commands in Git Bash terminal:

        curl -fsSL https://github.com/ninja-build/ninja/releases/download/v1.10.0/ninja-win.zip -o $TMPDIR/ninja-win.zip
        mkdir -p $LOCALAPPDATA/Programs/Ninja
        unzip $TMPDIR/ninja-win.zip -d $LOCALAPPDATA/Programs/Ninja

    Then add %LOCALAPPDATA%\Programs\Ninja to user PATH in Windows advanced system settings.

5. _(Optional)_ Download and install the latest GNU Arm Embedded toolchain:

    https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads

    Installation path assumed in this guide:

        C:/Program Files (x86)/GNU Tools ARM Embedded/9 2019-q4-major

6. _(Optional)_ Download and install Arm Compiler 6:

    https://developer.arm.com/tools-and-software/embedded/arm-compiler/downloads/version-6

    Example installation path:

        C:/Program Files/ARMCompiler6.13

    Arm Compiler 6 is also bundled with Keil uVision 5 IDE:

    https://www.keil.com/arm/

    Installation path assumed in this document:

        C:/Keil_v5/ARM/ARMCLANG

    Note: valid license is required to use the Arm Compiler.

6. _(Optional)_ Download and install IAR Embedded Workbench for ARM:

    https://www.iar.com/iar-embedded-workbench/#!?architecture=Arm

    Installation path assumed in this document:

        C:\Program Files (x86)\IAR Systems\Embedded Workbench 8.4

    Note: valid license is required to use the IAR Compiler.

### macOS

TBD

### Linux

TBD

## Quick Start Guide - CLI

1. Open interactive terminal, for example Git Bash on Windows.

2. Check the prerequisite tools were properly installed and added to PATH:

        cmake --version
        ninja --version

3. Clone this repo:

        git clone https://github.com/medvid/psoc6.cmake
        cd psoc6.cmake

4. Generate Ninja build rules using CMake. Example that generates build recipes for bare-metal applications targeting CY8CKIT-062-WIFI-BT board and GCC toolchain:

        cmake -G Ninja -S . -B build/CY8CKIT-062-WIFI-BT/NOOS/GCC/Debug \
            -DTARGET=CY8CKIT-062-WIFI-BT -DOS=NOOS -DTOOLCHAIN=GCC \
            -DGCC_TOOLCHAIN_PATH="C:/Program Files (x86)/GNU Tools ARM Embedded/9 2019-q4-major" \
            -DCMAKE_BUILD_TYPE=Debug

5. Build all applications enabled for the selected TARGET and OS combination:

        cmake --build build/CY8CKIT-062-WIFI-BT/NOOS/GCC/Debug

6. Connect CY8CKIT-062-WIFI-BT to the host. If needed, update the KitProg firmware using fw-loader:

    https://github.com/cypresssemiconductorco/Firmware-loader

    Make sure the kit is in CMSIS-DAP mode.

7. Program hello-world application to the PSoC 6 MCU:

        cmake --build build/CY8CKIT-062-WIFI-BT/NOOS/GCC/Debug --target hello-world_PROGRAM

8. Check the application behaves in accorandce with [app/hello-world/README.md][hello-world]

## Usage - Visual Studio Code

1. Install Visual Studio Code:

    https://aka.ms/vscode

2. Start Visual Studio Code. Select File -> Open Folder... -> browse to psoc6.cmake directory (on macOS, use File -> Open menu).

3. Install the required extensions:

    * [ms-vscode.cpptools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
    * [ms-vscode.cmake-tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools)
    * [marus25.cortex-debug](https://marketplace.visualstudio.com/items?itemName=marus25.cortex-debug)

4. Copy .vscode/settings.json.template as .vscode/settings.json, adjust paths (`modustoolbox.toolsPath`, `cortex-debug.armToolchainPath`, `cmake.configureSettings`).

5. In VSCode menu, select View -> Command Palette -> type: "CMake: Select a Kit" -> select one of the custom kits defined in .vscode/cmake-kits.json, for example: CY8CKIT-062-WIFI-BT/NOOS/GCC. Never select standard kits scanned from the host OS.

6. In the Command Palette, type: "CMake: Configure", wait while the CMake project is configured.

7. Type "CMake: Build Target", and select the build target, for example: hello-world_PROGRAM. Wait while the hello-world application is built and programmed.

8. Switch to the Debug tab on the left Panel, select the debug configuration depending on the selected BSP:

    | BSP                 | Launch target                  |
    | ------------------- | ------------------------------ |
    | CY8CKIT-062-BLE     | Launch CY8C6xx7 CM4 (KitProg3) |
    | CY8CKIT-062-WIFI-BT | Launch CY8C6xx7 CM4 (KitProg3) |
    | CY8CPROTO-062-4343W | Launch CY8C6xxA CM4 (KitProg3) |

9. Select the target ELF file, that corresponds to the CMake selected build target. For example, select "hello-world.elf" in case the current CMake target is "hello-world_PROGRAM".

10. The Cortex-Debug extension should start the debugging session using OpenOCD and KitProg3 CMSIS-DAP built-in debugger.

## Additional tips

* It is possible to call the Ninja program directly, for example:

        ninja -C build/CY8CKIT-062-WIFI-BT/NOOS/GCC/Debug hello-world_PROGRAM

    Often it is useful to call the ninja with additional arguments.
    For example, the below command enables verbosity and disables parallel compilation:

        cd build/CY8CKIT-062-WIFI-BT/NOOS/GCC/Debug
        ninja -v -j1

* Set PSOC6_FORCE_FETCH to update all cloned git repositories to match versions declared in CMake recipes:

    PSOC6_FORCE_FETCH=1 cmake -B build/CY8CKIT-062-WIFI-BT/NOOS/GCC/Debug

[ModusToolboxForWindows]: http://dlm.cypress.com.edgesuite.net/akdlm/downloadmanager/software/ModusToolbox/ModusToolbox_2.1/ModusToolbox_2.1.0.1266-windows-install.exe
[hello-world]: https://github.com/cypresssemiconductorco/mtb-example-psoc6-hello-world/blob/master/README.md#operation
