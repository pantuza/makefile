FROM golang:1.14-alpine

RUN apk add --update gcc musl-dev

COPY src /app

WORKDIR /app

CMD go run main.go
