cbin := "podman"
args := if capitalize(env("NOCACHE", "")) =~ "(YES|Y)" { "--no-cache" } else { "" } 

default:
    @just all

ubuntu:
    {{cbin}} build {{args}} -t toolbox-ubuntu -f ubuntu.containerfile

golang:
    {{cbin}} build {{args}} -t toolbox-golang:1.22 -f golang.containerfile

tools:
    {{cbin}} build {{args}} -t toolbox-tools -f tools.containerfile

all: ubuntu golang tools
