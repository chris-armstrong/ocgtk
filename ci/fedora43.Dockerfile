FROM fedora:43

ARG OPAM_VERSION=2.5.0
ARG OCAML_VERSION=5.3.0

# System dependencies
RUN dnf install -y \
    # Build toolchain
    gcc make m4 patch unzip bzip2 curl git \
    # OCaml / opam requirements
    pkgconf perl diffutils which rsync \
    # GTK 4 and friends
    gtk4-devel \
    cairo-devel \
    pango-devel \
    gdk-pixbuf2-devel \
    glib2-devel \
    # GIR files for code generation
    gobject-introspection-devel \
    # Headless display for running GTK tests
    xorg-x11-server-Xvfb \
 && dnf clean all

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
