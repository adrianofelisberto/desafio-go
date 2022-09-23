FROM golang:1.15-alpine AS build

WORKDIR /main

COPY main.go .

RUN go build -ldflags="-s -w" main.go


FROM scratch

WORKDIR /main

COPY --from=build /main .

ENTRYPOINT ["./main"]