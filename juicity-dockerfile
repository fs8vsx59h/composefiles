FROM golang:latest as builder
RUN git clone https://github.com/juicity/juicity.git \
&& cd juicity \
&& make CGO_ENABLED=0 juicity-server

FROM debian:latest as target
COPY --from=builder /go/juicity/juicity-server /bin/juicity-server
RUN apt-get update \
&& apt-get install -y ca-certificates \
&& mkdir /etc/juicity \
&& chmod +x /bin/juicity-server
CMD [ "juicity-server","run","-c","/etc/juicity/config.json" ]
