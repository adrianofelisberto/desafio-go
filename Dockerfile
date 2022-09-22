FROM golang:1.15 AS build

WORKDIR /main

COPY main.go .

RUN go build -o main


FROM scratch

WORKDIR /main

COPY --from=build /main .

ENTRYPOINT ["./main"]