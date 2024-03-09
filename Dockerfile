FROM golang:alpine AS builder
WORKDIR /app
COPY main.go .
ENV GO111MODULE=off
RUN go build -o main .

FROM scratch
COPY --from=builder /app/main /

CMD ["/main"]
