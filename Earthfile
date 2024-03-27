VERSION 0.8

rust-builder:
    FROM rust:buster
    RUN apt-get update && apt-get install -y clang
    # cargo-nextest
    COPY ./apps/* /usr/local/bin

reth:
    FROM +rust-builder
    GIT CLONE https://github.com/paradigmxyz/reth reth
    WORKDIR reth

# most run test
unit-test:
    FROM +reth
    ENV RUST_BACKTRACE 1
    RUN cargo nextest run --workspace --locked --exclude examples --exclude ef-tests

# slow test
state-test:
    FROM +reth
    ENV RUST_BACKTRACE 1
    GIT CLONE https://github.com/ethereum/tests reth/testing/ef-tests/ethereum-tests
    WORKDIR reth/ef-tests/ethereum-tests
    RUN cargo nextest run --release -p ef-tests --features "asm-keccak ef-tests"

doc-test:
    FROM +rust-builder
    ENV RUST_BACKTRACE 1
    GIT CLONE https://github.com/paradigmxyz/reth reth
    WORKDIR reth
    RUN cargo test --doc



# release management
