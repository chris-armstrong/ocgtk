(lang dune 3.21)

(name ocgtk)

(version 0.1~preview3)

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


(package
 (name occairo)
 (synopsis "OCaml bindings for Cairo's GObject types")
 (description
  "OCaml bindings for the GObject types and enumerations of the Cairo graphics library")
 (depends
  (ocaml
   (>= 4.14))
  (ocglib
   (= :version))
  conf-cairo-gobject
  (dune-configurator :build)
  (alcotest :with-test)))

(package
 (name ocgio)
 (synopsis "OCaml bindings for GIO")
 (description
  "OCaml bindings for GIO: I/O, files, and GLib's application and networking abstractions")
 (depends
  (ocaml
   (>= 4.14))
  (ocglib
   (= :version))
  conf-glib-2
  (dune-configurator :build)
  (alcotest :with-test)))

(package
 (name ocgraphene)
 (synopsis "OCaml bindings for Graphene")
 (description "OCaml bindings for the Graphene geometry library")
 (depends
  (ocaml
   (>= 4.14))
  (ocglib
   (= :version))
  conf-graphene-1
  (dune-configurator :build)
  (alcotest :with-test)))

(package
 (name ocgdkpixbuf)
 (synopsis "OCaml bindings for GdkPixbuf")
 (description "OCaml bindings for the GdkPixbuf image loading library")
 (depends
  (ocaml
   (>= 4.14))
  (ocglib
   (= :version))
  (ocgio
   (= :version))
  conf-gdk-pixbuf-2
  (dune-configurator :build)
  (alcotest :with-test)))

(package
 (name ocpango)
 (synopsis "OCaml bindings for Pango")
 (description "OCaml bindings for the Pango text layout library")
 (depends
  (ocaml
   (>= 4.14))
  (ocglib
   (= :version))
  (occairo
   (= :version))
  (ocgio
   (= :version))
  conf-pango
  (dune-configurator :build)
  (alcotest :with-test)))

(package
 (name ocpangocairo)
 (synopsis "OCaml bindings for PangoCairo")
 (description "OCaml bindings for PangoCairo, Pango's Cairo renderer")
 (depends
  (ocaml
   (>= 4.14))
  (ocglib
   (= :version))
  (occairo
   (= :version))
  (ocgio
   (= :version))
  (ocpango
   (= :version))
  conf-pangocairo
  (dune-configurator :build)
  (alcotest :with-test)))

(package
 (name ocgdk)
 (synopsis "OCaml bindings for GDK 4")
 (description "OCaml bindings for GDK 4, GTK's windowing and drawing layer")
 (depends
  (ocaml
   (>= 4.14))
  (ocglib
   (= :version))
  (occairo
   (= :version))
  (ocgdkpixbuf
   (= :version))
  (ocgio
   (= :version))
  (ocpango
   (= :version))
  (ocpangocairo
   (= :version))
  (conf-gtk4
   (>= 3))
  (dune-configurator :build)
  (alcotest :with-test)))

(package
 (name ocgsk)
 (synopsis "OCaml bindings for GSK 4")
 (description "OCaml bindings for GSK 4, GTK's scene graph renderer")
 (depends
  (ocaml
   (>= 4.14))
  (ocglib
   (= :version))
  (occairo
   (= :version))
  (ocgdk
   (= :version))
  (ocgdkpixbuf
   (= :version))
  (ocgio
   (= :version))
  (ocgraphene
   (= :version))
  (ocpango
   (= :version))
  (ocpangocairo
   (= :version))
  (conf-gtk4
   (>= 3))
  (dune-configurator :build)
  (alcotest :with-test)))

(package
 (name ocgtk)
 (synopsis "OCaml bindings for GTK 4")
 (description "ocgtk provides OCaml bindings for GTK 4")
 (depends
  (ocaml
   (>= 4.14))
  (ocglib
   (= :version))
  (occairo
   (= :version))
  (ocgdk
   (= :version))
  (ocgdkpixbuf
   (= :version))
  (ocgio
   (= :version))
  (ocgraphene
   (= :version))
  (ocgsk
   (= :version))
  (ocpango
   (= :version))
  (ocpangocairo
   (= :version))
  (conf-gtk4
   (>= 3))
  (dune-configurator :build)
  (alcotest :with-test)))
