(* GENERATED CODE - DO NOT EDIT *)
(* IOExtensionPoint: IOExtensionPoint *)

[@@@ocaml.text
"[GIOExtensionPoint] provides a mechanism for modules to extend the\n\
 functionality of the library or application that loaded it in an\n\
 organized fashion.\n\n\
 An extension point is identified by a name, and it may optionally\n\
 require that any implementation must be of a certain type (or derived\n\
 thereof). Use [Gio.IOExtensionPoint.register] to register an\n\
 extension point, and [Gio.IOExtensionPoint.set_required_type] to\n\
 set a required type.\n\n\
 A module can implement an extension point by specifying the\n\
 [GObject.Type] that implements the functionality. Additionally, each\n\
 implementation of an extension point has a name, and a priority. Use\n\
 [Gio.IOExtensionPoint.implement] to implement an extension point.\n\n\
 {[\n\
 GIOExtensionPoint *ep;\n\n\
 // Register an extension point\n\
 ep = g_io_extension_point_register (\"my-extension-point\");\n\
 g_io_extension_point_set_required_type (ep, MY_TYPE_EXAMPLE);\n\
 ]}\n\n\
 {[\n\
 // Implement an extension point\n\
 G_DEFINE_TYPE (MyExampleImpl, my_example_impl, MY_TYPE_EXAMPLE)\n\
 g_io_extension_point_implement (\"my-extension-point\",\n\
\                                my_example_impl_get_type (),\n\
\                                \"my-example\",\n\
\                                10);\n\
 ]}\n\n\
 It is up to the code that registered the extension point how\n\
 it uses the implementations that have been associated with it.\n\
 Depending on the use case, it may use all implementations, or\n\
 only the one with the highest priority, or pick a specific\n\
 one by name.\n\n\
 To avoid opening all modules just to find out what extension\n\
 points they implement, GIO makes use of a caching mechanism,\n\
 see gio-querymodules.\n\
 You are expected to run this command after installing a\n\
 GIO module.\n\n\
 The [GIO_EXTRA_MODULES] environment variable can be used to\n\
 specify additional directories to automatically load modules\n\
 from. This environment variable has the same syntax as the\n\
 [PATH]. If two modules have the same base name in different\n\
 directories, then the latter one will be ignored. If additional\n\
 directories are specified GIO will load modules from the built-in\n\
 directory last."]

type t = [ `io_extension_point ] Gobject.obj

(* Methods *)

external set_required_type : t -> Gobject.Type.t -> unit
  = "ml_g_io_extension_point_set_required_type"
(** Sets the required type for [extension_point] to [type]. All implementations
    must henceforth have this type. *)

external get_required_type : t -> Gobject.Type.t
  = "ml_g_io_extension_point_get_required_type"
(** Gets the required type for [extension_point]. *)

external get_extensions : t -> Io_extension.t list
  = "ml_g_io_extension_point_get_extensions"
(** Gets a list of all extensions that implement this extension point. The list
    is sorted by priority, beginning with the highest priority. *)

external get_extension_by_name : t -> string -> Io_extension.t
  = "ml_g_io_extension_point_get_extension_by_name"
(** Finds a [GIOExtension] for an extension point by name. *)
