FROM debian:bookworm-slim

RUN apt update -y && apt upgrade -y
RUN apt install -y --no-install-recommends \
    bash \
    build-essential \
    ca-certificates \
    curl \
    docker.io \
    git \
    jq \
    libffi-dev \
    libicu-dev \
    libssl-dev \
    sudo \
    tar
RUN curl -fsSL https://get.docker.com | sh
RUN rm -rf /var/lib/apt/lists/*
WORKDIR /tmp

ENV RUNNER_ALLOW_RUNASROOT=1
RUN curl --silent --output actions-runner-linux.tar.gz -L https://github.com/actions/runner/releases/download/v2.330.0/actions-runner-linux-arm64-2.330.0.tar.gz
RUN tar xzf ./actions-runner-linux.tar.gz
RUN rm actions-runner-linux.tar.gz
RUN chmod -R 1777 /tmp/
RUN ./bin/installdependencies.sh
COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
