FROM golang:1.14.3

VOLUME /var/log/todo-list
WORKDIR /go/src/app

COPY . .

RUN go get -d -v ./... \
    go install -v ./... \
    go build -o app

CMD ["./app"]