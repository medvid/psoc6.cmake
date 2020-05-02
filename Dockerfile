# Use https://github.com/medvid/docker-modustoolbox as a base image
FROM vmmedvid/modustoolbox:latest

# Install prerequisites
RUN apt update -y \
 && apt install -y apt-transport-https ca-certificates gnupg software-properties-common --no-install-recommends \
 && curl -fsSL https://apt.kitware.com/keys/kitware-archive-latest.asc | gpg --dearmor - | tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null \
 && apt-add-repository -y 'deb https://apt.kitware.com/ubuntu/ bionic main' \
 && apt update -y \
 && apt install -y cmake ninja-build --no-install-recommends \
 && apt autoremove -y --purge gnupg \
 && apt clean
