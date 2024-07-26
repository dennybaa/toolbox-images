FROM docker.io/golang:1.22
ARG USER=dennybaa
ARG UID=1000

RUN apt-get update && \
    apt-get -y install zsh curl unzip libcap2-bin git sudo procps less \ 
                neovim && \
    apt-get clean && \
    update-alternatives --set editor /usr/bin/nvim

RUN echo "#${UID} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
ENV LANG=C.UTF-8

## An ugly workaround
## ref: https://github.com/microsoft/vscode-remote-release/issues/4443#issuecomment-1724134037
RUN chmod 701 /root && cd /root && \
    mkdir .devcontainer .vscode-server && \
    chmod 777 .devcontainer .vscode-server