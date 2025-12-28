(* GENERATED CODE - DO NOT EDIT *)
(* IOExtensionPoint: IOExtensionPoint *)

(** `GIOExtensionPoint` provides a mechanism for modules to extend the
functionality of the library or application that loaded it in an
organized fashion.

An extension point is identified by a name, and it may optionally
require that any implementation must be of a certain type (or derived
thereof). Use [func@Gio.IOExtensionPoint.register] to register an
extension point, and [method@Gio.IOExtensionPoint.set_required_type] to
set a required type.

A module can implement an extension point by specifying the
[type@GObject.Type] that implements the functionality. Additionally, each
implementation of an extension point has a name, and a priority. Use
[func@Gio.IOExtensionPoint.implement] to implement an extension point.

```c
GIOExtensionPoint *ep;

// Register an extension point
ep = g_io_extension_point_register ("my-extension-point");
g_io_extension_point_set_required_type (ep, MY_TYPE_EXAMPLE);
```

```c
// Implement an extension point
G_DEFINE_TYPE (MyExampleImpl, my_example_impl, MY_TYPE_EXAMPLE)
g_io_extension_point_implement ("my-extension-point",
                                my_example_impl_get_type (),
                                "my-example",
                                10);
```

 It is up to the code that registered the extension point how
 it uses the implementations that have been associated with it.
 Depending on the use case, it may use all implementations, or
 only the one with the highest priority, or pick a specific
 one by name.

 To avoid opening all modules just to find out what extension
 points they implement, GIO makes use of a caching mechanism,
 see [gio-querymodules](gio-querymodules.html).
 You are expected to run this command after installing a
 GIO module.

 The `GIO_EXTRA_MODULES` environment variable can be used to
 specify additional directories to automatically load modules
 from. This environment variable has the same syntax as the
 `PATH`. If two modules have the same base name in different
 directories, then the latter one will be ignored. If additional
 directories are specified GIO will load modules from the built-in
 directory last. *)
type t = [`io_extension_point] Gobject.obj

(* Methods *)
(** Finds a #GIOExtension for an extension point by name. *)
external get_extension_by_name : t -> string -> Io_extension.t = "ml_g_io_extension_point_get_extension_by_name"

