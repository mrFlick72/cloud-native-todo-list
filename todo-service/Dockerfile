FROM golang:1.15.8

VOLUME /var/log/todo-list
WORKDIR /go/src/app

COPY . .

RUN go get -d -v ./...  && \
    go install -v ./... && \
    go build -o app

CMD ["./app"]