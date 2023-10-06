FROM golang:1.21.1-alpine as builder

RUN go version
RUN apk add git

COPY ./ /src
WORKDIR /src

RUN go mod download && go get -u ./...
RUN CGO_ENABLED=0 GOOS=linux go build -o ./bin/app ./cmd/app/main.go

FROM alpine:latest

RUN apk --no-cache add ca-certificates
WORKDIR /root

COPY --from=builder /src/bin/app .

EXPOSE 4040

CMD["./app"]