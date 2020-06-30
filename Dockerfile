FROM hashicorp/terraform:0.12.26
RUN apk add --no-cache --update zip bash curl py-pip py3-setuptools openssh-client && \
    pip3 install --upgrade awscli && \
    export PATH=$JAVA_HOME/bin:$PATH && \
    mkdir -p ~/.ssh && \
    chmod 700 ~/.ssh && \
    touch ~/.ssh/known_hosts && \
    echo "$SSH_KNOWN_HOSTS" > ~/.ssh/known_hosts && \
    chmod 644 ~/.ssh/known_hosts && \
    terraform --version

ENTRYPOINT ["/usr/bin/env", "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"]
