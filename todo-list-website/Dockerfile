FROM golang:1.15.8

VOLUME /var/log/todo-list-website
WORKDIR /go/src/app

COPY api api
COPY middleware middleware
COPY static static
COPY go.mod .
COPY main.go .

RUN go get -d -v ./...  && \
    go install -v ./... && \
    go build -o app

CMD ["./app"]