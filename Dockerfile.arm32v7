FROM alpine AS builder

# Download QEMU, see https://github.com/docker/hub-feedback/issues/1261
ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v3.0.0%2Bresin/qemu-3.0.0+resin-arm.tar.gz
RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1


FROM arm32v7/alpine:latest

# Add QEMU
COPY --from=builder qemu-arm-static /usr/bin

MAINTAINER jstrader

RUN apk add --no-cache openvpn

# additional files
##################

# add install bash script
#ADD build/root/*.sh /root/

# add bash script to run openvpn
ADD run/root/*.sh /root/

# add bash script to run privoxy
ADD run/nobody/*.sh /home/nobody/

# install app
#############

# docker settings
#################

# expose port for privoxy
EXPOSE 8118


