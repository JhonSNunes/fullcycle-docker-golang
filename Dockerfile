FROM golang:alpine3.19 as builder

WORKDIR /go/src/hello/

COPY hello/hello.go /go/src/hello/

RUN go mod init challenge/hello

RUN go install challenge/hello


FROM scratch

COPY --from=builder /go/bin/ .

ENTRYPOINT [ "/hello" ]