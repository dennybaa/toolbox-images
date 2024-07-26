FROM toolbox-ubuntu

RUN curl -sL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \   
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
    apt update -y

RUN apt-get -y install terraform vault git-crypt \
    # gcc is required for kcl to run \
    gcc \
    && apt-get clean -y \
    && rm -rf /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sSL https://kcl-lang.io/script/install-cli.sh | /bin/bash -s
