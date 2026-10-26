FROM opensuse/leap:15.6

ARG OPAM_VERSION=2.5.0
ARG OCAML_VERSION=5.5.2

# System dependencies
RUN zypper refresh && zypper install -y \
    # Build toolchain
    gcc make m4 patch unzip bzip2 gzip curl git tar \
    # OCaml / opam requirements
    pkg-config perl diffutils which rsync \
    # GTK 4 and friends
    gtk4-devel \
    cairo-devel \
    pango-devel \
    gdk-pixbuf-devel \
    glib2-devel \
    # GIR files for code generation
    gobject-introspection-devel \
    # Headless display for running GTK tests
    xorg-x11-server-Xvfb \
    xvfb-run \
 && zypper clean --all

# Install opam
RUN curl -fsSL "https://github.com/ocaml/opam/releases/download/${OPAM_VERSION}/opam-${OPAM_VERSION}-x86_64-linux" \
      -o /usr/local/bin/opam \
 && chmod +x /usr/local/bin/opam

# Bootstrap opam and create OCaml switch
RUN opam init --disable-sandboxing -y --bare \
 && opam switch create default "ocaml-base-compiler.${OCAML_VERSION}" -y \
 && opam clean -a -c -s

# Pin our conf packages (not in opam-repository yet) and install OCaml deps
WORKDIR /tmp/opam-bootstrap
COPY conf-cairo-gobject/ ./conf-cairo-gobject/
COPY conf-gdk-pixbuf-2/ ./conf-gdk-pixbuf-2/
COPY conf-graphene-1/ ./conf-graphene-1/
COPY conf-gtk4/ ./conf-gtk4/
COPY conf-pangocairo/ ./conf-pangocairo/
COPY *.opam ./
COPY gir_gen/gir_gen.opam ./gir_gen/gir_gen.opam
RUN eval $(opam env) \
 && for p in conf-*/; do opam pin add -n -y "${p%/}" "./$p"; done \
 && opam install --deps-only --with-test -y . ./gir_gen \
 && opam clean -a -c -s \
 && rm -rf /tmp/opam-bootstrap

WORKDIR /workspace
