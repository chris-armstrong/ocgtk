FROM ghcr.io/chris-armstrong/ocaml-devcontainer:5.4-ubuntu
RUN sudo ln -fs /usr/share/zoneinfo/Australia/Sydney /etc/localtime

RUN sudo apt-get update && export DEBIAN_FRONTEND=noninteractive && sudo apt-get --no-install-recommends -y install rsync libgtk-4-dev m4 xdot ripgrep neovim xvfb && sudo apt-get autoremove -y && sudo apt-get clean -y

RUN opam update

RUN curl -fsSL https://opencode.ai/install | bash
