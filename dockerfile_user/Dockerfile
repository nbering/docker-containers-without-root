FROM golang:1.13 AS build
WORKDIR /go/src/github.com/docker-containers-without-root/app
COPY app/main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o app .

FROM busybox
COPY --from=build /go/src/github.com/docker-containers-without-root/app/app /bin
USER nobody
CMD ["/bin/app"]
