FROM golang:1.13 AS build
RUN CGO_ENABLED=0 go get -u github.com/tianon/gosu
WORKDIR /go/src/github.com/docker-containers-without-root/app
COPY app/main.go .
RUN CGO_ENABLED=0 GOOS=linux go install

FROM busybox
COPY --from=build /go/bin/app /bin
COPY --from=build /go/bin/gosu /bin
COPY samples/03_gosu/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
