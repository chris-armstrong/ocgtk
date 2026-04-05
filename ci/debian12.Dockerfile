FROM debian:12

ENV DEBIAN_FRONTEND=noninteractive

# System dependencies
RUN apt-get update && apt-get install -y \
    # Build toolchain
    gcc make m4 patch unzip bzip2 curl git \
    # OCaml / opam requirements
    pkg-config perl diffutils \
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
RUN curl -fsSL https://github.com/ocaml/opam/releases/download/2.4.1/opam-2.4.1-x86_64-linux \
      -o /usr/local/bin/opam \
 && chmod +x /usr/local/bin/opam

# Bootstrap opam and create OCaml 5.3.0 switch
RUN opam init --disable-sandboxing -y --bare \
 && opam switch create default ocaml-base-compiler.5.3.0 -y \
 && opam clean -a -c -s

# Install conf-gtk4 (local virtual package) and OCaml deps
WORKDIR /tmp/opam-bootstrap
COPY conf-gtk4/ ./conf-gtk4/
RUN eval $(opam env) \
 && opam install ./conf-gtk4 -y \
 && opam install \
      xmlm fmt logs containers re sexplib \
      ppx_sexp_conv ppx_deriving cmdliner ppxlib \
      alcotest \
      -y \
 && opam clean -a -c -s \
 && rm -rf /tmp/opam-bootstrap

WORKDIR /workspace
