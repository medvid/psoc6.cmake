#!/usr/bin/env bash

# Switch to the root directory
cd "$(dirname "${BASH_SOURCE[0]}")/.."

# Enable strict mode
set -eux

# Diagnose tool versions
cmake --version
ninja --version

#rm -rf build
errlist=""
NL=$'\n'

for bsp in CY8CKIT-062-BLE CY8CKIT-062-WIFI-BT CY8CPROTO-062-4343W; do
  for os in NOOS FREERTOS RTX; do
    for toolchain in GCC ARM IAR; do
      for config in Debug Release; do
        err=0
        id=$bsp/$os/$toolchain/$config
        echo id=$id
        cfg_cmd="cmake -S . -B build/$id -G Ninja -DTARGET=$bsp -DOS=$os -DTOOLCHAIN=$toolchain -DCMAKE_BUILD_TYPE=$config"
        #[[ $toolchain == GCC ]] && cfg_cmd+=" -DGCC_TOOLCHAIN_PATH='C:/Program Files (x86)/GNU Tools ARM Embedded/9 2019-q4-major'"
        $cfg_cmd || err=$?
        if [[ $err -eq 0 ]]; then
          bld_cmd="cmake --build build/$id"
          $bld_cmd || err=$?
          if [[ $err -ne 0 ]]; then
            errlist+="$id${NL}"
            errlist+="$bld_cmd${NL}"
          fi
        else
          errlist+="$id${NL}"
          errlist+="$cfg_cmd${NL}"
        fi
      done
    done
  done
done

set +x
echo $errlist
