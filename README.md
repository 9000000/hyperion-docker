# hyperion.ng Docker Image

[
  ![](https://img.shields.io/docker/v/foorschtbar/hyperion?style=plastic&sort=date)
  ![](https://img.shields.io/docker/pulls/foorschtbar/hyperion?style=plastic)
  ![](https://img.shields.io/docker/stars/foorschtbar/hyperion?style=plastic)
  ![](https://img.shields.io/docker/image-size/foorschtbar/hyperion?style=plastic)
  ![](https://img.shields.io/github/actions/workflow/status/foorschtbar/hyperion-docker/build.yml?branch=master&style=plastic)
](https://hub.docker.com/repository/docker/foorschtbar/hyperion)
[
  ![](https://img.shields.io/github/last-commit/foorschtbar/hyperion-docker?style=plastic)
](https://github.com/foorschtbar/hyperion-docker)

Multi-Arch/Multi-Platform Docker Container for [hyperion.ng](https://github.com/hyperion-project/hyperion.ng). [Hyperion](https://github.com/hyperion-project/hyperion.ng) is an opensource [Bias or Ambient Lighting](https://en.wikipedia.org/wiki/Bias_lighting) implementation which you might know from TV manufacturers. It supports many LED devices and video grabbers.

* GitHub: [foorschtbar/hyperion-docker](https://github.com/foorschtbar/hyperion-docker)
* Docker Hub: [foorschtbar/hyperion](https://hub.docker.com/r/foorschtbar/hyperion)

## Usage

Example docker-compose configuration:

```yml
services:
  hyperion:
    image: matrix37/hyperion:nightly
    container_name: hyperion
    # privileged: true # for PWM
    ports:
      - 8095:8090
      - 8093:8092
      - 19410:19400
      - 19454:19444
      - 19455:19445
    volumes:
      - ./config/:/root/.hyperion:rw
    #devices:
    # - /dev/video0:/dev/video0
    # - /dev/spidev0.0:/dev/spidev0.0 # for SPI
    restart: unless-stopped
    network_mode: host
```
