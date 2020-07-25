FROM golang:1.14.6 as build

RUN apt-get update 
RUN apt-get install -y unzip patch

ARG BUF_VERSION=v0.20.4

RUN cd src && git clone https://github.com/bufbuild/buf.git

COPY patch-armv7.txt /tmp
RUN cd src/buf && git checkout ${BUF_VERSION} && \
    patch -p0 < /tmp/patch-armv7.txt && \
    cd cmd/buf && go build main.go 

FROM golang:1.14.6

COPY --from=build /go/src/buf/cmd/buf/main /usr/bin/buf

ENTRYPOINT /usr/bin/buf
