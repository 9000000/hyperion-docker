# ubuntu:jammy is LTS and will be supported until 2027/04
FROM ubuntu:jammy 
ARG RELEASE_TYPE=STABLE

# Preventing debconf errors
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
# Checkout https://github.com/hyperion-project/hyperion.docker-ci/blob/master/ubuntu_debian for changes
RUN set -eux; \
    apt-get update ; \
    apt-get upgrade -y ; \
    apt-get install -y \
    wget \
    gnupg \
    gpg \
    dirmngr \
    libgnutls30 \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    libqt5sql5-sqlite \
    openssl  \
    libx11-6 \
    libusb-1.0-0  \
    libftdi1-2 \
    libexpat-dev  \
    libgl-dev  \
    libfreetype6 \
    libpython3.10 \
    devscripts \
    fakeroot \
    debhelper \
    libdistro-info-perl \
    git \
    curl \
    python3-dev \
    build-essential \
    ninja-build \
    libusb-1.0-0-dev \
    libcec-dev \
    libp8-platform-dev \
    libudev-dev \
    libavahi-core-dev \
    libavahi-compat-libdnssd-dev \
    zlib1g-dev \
    libasound2-dev \
    libjpeg-dev \
    libturbojpeg0-dev \
    libmbedtls-dev \
    libftdi1-dev \
    libssl-dev \
    libglib2.0-dev; \
    apt-get clean -q -y ; \
    apt-get autoremove -y ; \
    rm -rf /var/lib/apt/lists/*

# Install latest Hyperion
RUN set -eux; \
    wget --no-check-certificate -qO- https://releases.hyperion-project.org/hyperion.pub.key | gpg --dearmor -o /usr/share/keyrings/hyperion.pub.gpg;\
    echo "deb [signed-by=/usr/share/keyrings/hyperion.pub.gpg] https://apt.releases.hyperion-project.org/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hyperion.list;\
    apt-get update ; \
    apt-get install -y hyperion; \
    apt-get clean -q -y ; \
    apt-get autoremove -y ; \
    rm -rf /var/lib/apt/lists/*
    
EXPOSE 8090 8092 19400 19444 19445 

ENTRYPOINT "/usr/bin/hyperiond"
