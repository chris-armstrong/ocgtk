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

## Signal handling — partially implemented

- Parameterless void signals are fully generated.
- Signals with primitive parameters and some GObject parameters are now supported via `signal_marshaller.ml`.
- Typed-parameter signals with return values and complex types (e.g. `GdkEvent`) are still deferred.
- See active plan: [`gir_gen/docs/plans/milestone-2-signals.md`](../../gir_gen/docs/plans/milestone-2-signals.md)

## Interface generation

Interfaces are generated as classes, but need to be generated as virtual classes with virtual methods (and then inherited) or class types to be useful.
