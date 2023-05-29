FROM golang:alpine as builder

ADD . /app

WORKDIR /app

RUN go build -ldflags "-s -w" -o main .

FROM scratch

COPY --from=builder /app/main /app/

ENTRYPOINT ["/app/main"]
