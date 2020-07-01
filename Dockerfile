FROM golang:1.12.16-alpine
RUN apk add --update --no-cache ca-certificates git gcc libc-dev
ENV GO111MODULE on
ENV GOSEC_VERSION 2.3.0
RUN wget https://github.com/securego/gosec/releases/download/v${GOSEC_VERSION}/gosec_${GOSEC_VERSION}_linux_amd64.tar.gz \
&& tar zxvpf gosec_${GOSEC_VERSION}_linux_amd64.tar.gz gosec && mv gosec /bin/ && rm -f gosec_${GOSEC_VERSION}_linux_amd64.tar.gz
RUN gosec --version
RUN mkdir /app
WORKDIR /app
ENTRYPOINT ["/bin/gosec"]