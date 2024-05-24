# syntax=docker/dockerfile:1
FROM golang:1.20-alpine
WORKDIR /src
COPY . .

RUN go mod download -x && \
    go build -o /bin/client ./cmd/client && \
    go build -o /bin/server ./cmd/server
ENTRYPOINT [ "/bin/server" ]
