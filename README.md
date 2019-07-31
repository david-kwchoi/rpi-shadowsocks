# rpi-shadowsocks
Dockerfile for building shadowsocks on RPI
This is a Dockerfile for shadowsocks-libev, with balenalib/raspberrypi3:buster as the base image

## Getting Started
### Run in detached mode
```
docker pull b1iz4rclavid/rpi-shadowsocks
docker run -d -e PASSWORD=<password> -p <docker_host_port>:8388 -p <docker_host_port>:8388/udp -it b1iz4rclavid/rpi-shadowsocks
```
### Shell access to the running container
```
docker exec -it <container id> /bin/bash
``` 

## Configuration
### Customise by overriding env variables
- PASSWORD    password to be used to connect to the shadowsocks container
- METHOD      encryption method, default to be aes-256-gcm
- TIMEOUT     server timeout in seconds, default to be 300
- DNS_ADDRS   dns server address, 8.8.8.8,8.8.4.4
- ARG         extra args to be supplied to ss-server

#### Example to expose host port 8018 with password 'test123'
```
docker run -d -e PASSWORD=test123 -e ARGS=-v -p 8018:8388 -p 8018:8388/udp -it b1iz4rclavid/rpi-shadowsocks
```

### Prerequisites
You will need to have docker installed on your rpi. 
Please refer to https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/

```
curl -sSL https://get.docker.com | sh
```
