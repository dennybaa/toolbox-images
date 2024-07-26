cbin := "podman"

default:
    @just all

ubuntu:
    {{cbin}} build -t toolbox-ubuntu -f ubuntu.containerfile

golang:
    {{cbin}} build -t toolbox-golang:1.22 -f golang.containerfile

tools:
    {{cbin}} build -t toolbox-tools -f tools.containerfile

all: ubuntu golang tools
