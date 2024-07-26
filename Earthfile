VERSION 0.7
ARG --global TF_VERSION=1.7.2-1
ARG --global USER=dennybaa
ARG --global UID=1000

ubuntu:
    FROM docker.io/ubuntu:24.04
    RUN apt-get update && \
        apt-get -y install zsh curl unzip libcap2-bin git sudo procps less \ 
                    neovim gpg lsb-release && \
        apt-get clean && \
        update-alternatives --set editor /usr/bin/nvim

    RUN sed -i -e 's/ ALL$/ NOPASSWD:ALL/' /etc/sudoers
    ENV LANG=C.UTF-8

    ## An ugly workaround
    ## ref: https://github.com/microsoft/vscode-remote-release/issues/4443#issuecomment-1724134037
    RUN chmod 701 /root && cd /root && \
        mkdir .devcontainer .vscode-server && \
        chmod 777 .devcontainer .vscode-server

    SAVE IMAGE toolbox-ubuntu:latest

terraform:
    FROM +ubuntu
    RUN curl -sL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \   
        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
        apt update -y
    RUN apt-get -y install terraform=$TF_VERSION vault && apt-get clean -y

    SAVE IMAGE toolbox-terraform:latest

golang-1.22:
    FROM docker.io/golang:1.22-bookworm
    RUN apt-get update && \
        apt-get -y install zsh curl unzip libcap2-bin git sudo procps less \ 
                    neovim && \
        apt-get clean && \
        update-alternatives --set editor /usr/bin/nvim

    RUN sed -i -e 's/ ALL$/ NOPASSWD:ALL/' /etc/sudoers
    ENV LANG=C.UTF-8

    ## An ugly workaround
    ## ref: https://github.com/microsoft/vscode-remote-release/issues/4443#issuecomment-1724134037
    RUN chmod 701 /root && cd /root && \
        mkdir .devcontainer .vscode-server && \
        chmod 777 .devcontainer .vscode-server

    SAVE IMAGE toolbox-golang:1.22

node-22:
    FROM docker.io/node:22-slim
    RUN apt-get update && \
        apt-get -y install zsh curl unzip libcap2-bin git sudo procps less \ 
                    neovim && \
        apt-get clean && \
        update-alternatives --set editor /usr/bin/nvim

    # Change existing user name to my username
    RUN usermod -l ${USER} $(id -un ${UID})
    RUN sed -i -e 's/ ALL$/ NOPASSWD:ALL/' /etc/sudoers
    ENV LANG=C.UTF-8

    ## An ugly workaround
    ## ref: https://github.com/microsoft/vscode-remote-release/issues/4443#issuecomment-1724134037
    RUN chmod 701 /root && cd /root && \
        mkdir .devcontainer .vscode-server && \
        chmod 777 .devcontainer .vscode-server

    SAVE IMAGE toolbox-node:22

python:
    FROM docker.io/python:3-bookworm
    RUN apt-get update && \
        apt-get -y install zsh curl unzip libcap2-bin git sudo procps less \ 
                    neovim && \
        apt-get clean && \
        update-alternatives --set editor /usr/bin/nvim

    # Change existing user name to my username
    # RUN usermod -l ${USER} $(id -un ${UID})
    RUN sed -i -e 's/ ALL$/ NOPASSWD:ALL/' /etc/sudoers
    ENV LANG=C.UTF-8

    ## An ugly workaround
    ## ref: https://github.com/microsoft/vscode-remote-release/issues/4443#issuecomment-1724134037
    RUN chmod 701 /root && cd /root && \
        mkdir .devcontainer .vscode-server && \
        chmod 777 .devcontainer .vscode-server

    SAVE IMAGE toolbox-python

all:
    BUILD +terraform
    BUILD +node-22
    BUILD +golang-1.22
    BUILD +python
