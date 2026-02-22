FROM rust:1.76-slim-bullseye

# Node.js と npm, およびその他のビルド依存パッケージのインストール
RUN apt-get update && apt-get install -y \
    curl \
    pkg-config \
    libssl-dev \
    git \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# wasm-pack のインストール
RUN curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

WORKDIR /app
