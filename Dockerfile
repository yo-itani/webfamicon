FROM rust:1.76-slim-bookworm

ARG UID=1000
ARG GID=1000

# 一般ユーザーを作成 (ホストのUID:GIDと合わせる用)
# `node` ユーザーやグループがすでに存在する場合の衝突を避けるための処理などを挟む
RUN groupadd -g ${GID} developer || echo "Group ${GID} already exists" \
    && useradd -u ${UID} -g ${GID} -s /bin/bash -m developer || echo "User ${UID} already exists" \
    && apt-get update && apt-get install -y sudo \
    && echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Node.js と npm, およびその他のビルド依存パッケージのインストール
RUN apt-get update && apt-get install -y \
    curl \
    pkg-config \
    libssl-dev \
    git \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# 以下はdeveloperユーザーで実行
USER developer
ENV HOME /home/developer

# wasm-pack のインストール
RUN curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

WORKDIR /app
