FROM golang:1.15.8

VOLUME /var/log/todo-list-website
WORKDIR /go/src/app

COPY views .
COPY *.go .

RUN go get -d -v ./...  && \
    go install -v ./... && \
    go build -o /var/log/todo-list-website/app

WORKDIR /var/log/todo-list-website

CMD ["app"]