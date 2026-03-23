# Build ctx from source in a throwaway stage
FROM docker.io/library/golang:latest AS ctx-builder
RUN git clone https://github.com/ActiveMemory/ctx.git /ctx \
    && cd /ctx \
    && make build

FROM ghcr.io/chris-armstrong/ocaml-devcontainer:5.4-ubuntu
RUN sudo ln -fs /usr/share/zoneinfo/Australia/Sydney /etc/localtime

RUN sudo apt-get update && export DEBIAN_FRONTEND=noninteractive && sudo apt-get --no-install-recommends -y install rsync libgtk-4-dev m4 xdot ripgrep neovim xvfb && sudo apt-get autoremove -y && sudo apt-get clean -y

RUN opam update

RUN curl -fsSL https://opencode.ai/install | bash

# Install Claude Code
RUN curl -fsSL https://claude.ai/install.sh | bash

# Copy ctx binary from builder stage
COPY --from=ctx-builder /ctx/ctx /usr/local/bin/ctx
