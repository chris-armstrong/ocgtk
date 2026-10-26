(lang dune 3.21)

(version 0.1~preview2)

(generate_opam_files true)

(source
 (github chris-armstrong/ocgtk))

(license "LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception")

(authors "Chris Armstrong")

(maintainers "hello@chrisarmstrong.dev")

(implicit_transitive_deps false-if-hidden-includes-supported)

(package
 (name ocglib)
 (synopsis "OCaml bindings for GLib and GObject")
 (description
  "Hand-written GLib and GObject bindings and the shared C runtime for the ocgtk family of libraries")
 (depends
  (ocaml
   (>= 4.14))
  conf-glib-2
  (dune-configurator :build)
  (alcotest :with-test)))

