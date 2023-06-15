FROM golang:alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o app .

# Use a minimal base image
FROM alpine:latest

COPY --from=builder /app/app ./app

EXPOSE 9090

CMD ["./app"]
