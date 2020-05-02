# Use https://github.com/medvid/docker-modustoolbox as a base image
FROM vmmedvid/modustoolbox:latest

# Install CMake and Ninja
RUN apt update -y \
 && apt install -y apt-transport-https ca-certificates gnupg software-properties-common --no-install-recommends \
 && curl -fsSL https://apt.kitware.com/keys/kitware-archive-latest.asc | gpg --dearmor - | tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null \
 && apt-add-repository -y 'deb https://apt.kitware.com/ubuntu/ bionic main' \
 && apt update -y \
 && apt install -y cmake ninja-build --no-install-recommends \
 && apt autoremove -y --purge gnupg \
 && apt clean

# Install GCC 9.2.1
RUN curl -fsSL https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2 -o /tmp/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2 \
 && tar -C /opt -xjf /tmp/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2 \
 && rm /tmp/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2

