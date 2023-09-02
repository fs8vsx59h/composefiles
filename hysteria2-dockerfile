FROM golang:latest as builder
RUN git clone https://github.com/apernet/hysteria.git \
&&  apt update \
&&  apt install python3-requests -y
WORKDIR /go/hysteria
ARG HY_APP_PLATFORMS=linux/amd64
RUN python3 hyperbole.py build

FROM debian:latest as target
COPY --from=builder /go/hysteria/build/hysteria-linux-amd64 /bin/hysteria
RUN apt-get update && apt-get install ca-certificates -y \
&& chmod +x /bin/hysteria && mkdir /etc/hysteria
CMD [ "/bin/hysteria","server","-c","/etc/hysteria/config.yaml" ]
