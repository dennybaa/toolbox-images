cbin := "podman"

default:
    @just all

ubuntu:
    {{cbin}} build -t toolbox-ubuntu -f ubuntu.containerfile

golang:
    {{cbin}} build -t toolbox-golang:1.22 -f golang.containerfile

all: ubuntu golang
