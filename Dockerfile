FROM golang:1.12.0-alpine3.9 AS builder

WORKDIR /usr/app

COPY ./src/main.go .

RUN go build

FROM scratch

WORKDIR /usr/app

COPY --from=builder /usr/app/ .

CMD [ "./app" ]