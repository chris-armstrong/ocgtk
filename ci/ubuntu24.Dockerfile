FROM ubuntu:24.04

ARG OPAM_VERSION=2.5.0
ARG OCAML_VERSION=5.3.0

ENV DEBIAN_FRONTEND=noninteractive

# System dependencies
RUN apt-get update && apt-get install -y \
    # Build toolchain
    gcc make m4 patch unzip bzip2 curl git \
    # OCaml / opam requirements
    pkg-config perl diffutils rsync \
    # GTK 4 and friends
    libgtk-4-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libgdk-pixbuf-2.0-dev \
    libglib2.0-dev \
    # GIR files for code generation
    libgirepository1.0-dev \
    gir1.2-gtk-4.0 \
    # Headless display for running GTK tests
    xvfb \
 && rm -rf /var/lib/apt/lists/*

# Install opam
RUN curl -fsSL "https://github.com/ocaml/opam/releases/download/${OPAM_VERSION}/opam-${OPAM_VERSION}-x86_64-linux" \
      -o /usr/local/bin/opam \
 && chmod +x /usr/local/bin/opam

# Bootstrap opam and create OCaml switch
RUN opam init --disable-sandboxing -y --bare \
 && opam switch create default "ocaml-base-compiler.${OCAML_VERSION}" -y \
 && opam clean -a -c -s

# Install conf-gtk4 (local virtual package) and OCaml deps
WORKDIR /tmp/opam-bootstrap
COPY conf-gtk4/ ./conf-gtk4/
COPY ocgtk/ocgtk.opam ./ocgtk/ocgtk.opam
COPY gir_gen/gir_gen.opam ./gir_gen/gir_gen.opam
RUN eval $(opam env) \
 && opam pin add -n conf-gtk4 ./conf-gtk4 \
 && opam install --deps-only --with-test -y ./ocgtk ./gir_gen \
 && opam clean -a -c -s \
 && rm -rf /tmp/opam-bootstrap

WORKDIR /workspace
