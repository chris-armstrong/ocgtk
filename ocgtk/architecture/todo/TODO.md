# Todos

A high level overview of porting and cleanup tasks needed to get ocgtk4 to a 1.0

## Known bugs

See [KNOWN_BUGS.md](./KNOWN_BUGS.md)

## Split up into several sub-libraries ✅ DONE

All 9 GIR namespaces are generated as separate libraries via `scripts/generate-bindings.sh`:
Cairo, Gio, Gdk, Graphene, GdkPixbuf, Pango, PangoCairo, Gsk, Gtk.

Cross-namespace type resolution works via reference files and `<ns>_decls.h` headers. See [CROSS_NAMESPACE_PLAN.md](./CROSS_NAMESPACE_PLAN.md).

## Class hierarchy

* ~~Generate all classes in a class hierarchy with #as_<type>, not just those in the Widget hierarchy (e.g. Expression)~~ — Done: hierarchy_info abstraction removed (was dead code). Parent chain drives polymorphic variant types. Layer 1 accessors not yet generated from parent chain.
* Update methods that take a class value like "#expression" (which means anything polymorphically implementing that interface) to work

## Non-void signals

We don't handle non-void signals / callbacks at this time. Only parameterless void signals are generated.

## Interface generation

Interfaces are generated as classes, but need to be generated as virtual classes with virtual methods (and then inherited) or class types to be useful.
