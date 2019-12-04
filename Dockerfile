FROM alpine:latest

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
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh