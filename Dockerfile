FROM golang:alpine as build

WORKDIR /go/src/app

COPY . .

RUN go mod init

RUN go build code.go

FROM scratch

COPY --from=build /go/src/app /

CMD ["./code"]
