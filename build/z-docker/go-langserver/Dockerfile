FROM golang:latest as builder
LABEL maintainer "Zate <zate75@gmail.com>"

#WORKDIR /go/src/github.com/user/app
RUN go get -u github.com/golang/dep/... && \
    mkdir -p /go/src/github.com/sourcegraph && \
    cd /go/src/github.com/sourcegraph && \
    git clone https://github.com/sourcegraph/go-langserver.git
WORKDIR /go/src/github.com/sourcegraph/go-langserver
RUN dep init && \
    dep ensure && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o go-langserver .

#RUN dep ensure
#RUN go get -u github.com/sourcegraph/go-langserver
#COPY . .
#RUN set -x && \
#    go get -d -v . && \


# Docker run Golang app
FROM scratch
LABEL maintainer "Zate <zate75@gmail.com>"

WORKDIR /
EXPOSE 4389
COPY --from=builder /go/src/github.com/sourcegraph/go-langserver/go-langserver .
CMD ["-gocodecompletion", "-mode", "tcp", "-trace"]
ENTRYPOINT ["/go-langserver"]