(* GENERATED CODE - DO NOT EDIT *)
(* IOModule: IOModule *)

type t = [`io_module | `type_module] Gobject.obj

(** Create a new IOModule *)
external new_ : unit -> t = "ml_g_io_module_new"

(* Methods *)
(** Required API for GIO modules to implement.

This function is run when the module is being unloaded from GIO,
to finalize the module.

Since 2.56, this function should be named `g_io_<modulename>_unload`, where
`modulename` is the plugin’s filename with the `lib` or `libgio` prefix and
everything after the first dot removed, and with `-` replaced with `_`
throughout. For example, `libgiognutls-helper.so` becomes `gnutls_helper`.
Using the new symbol names avoids name clashes when building modules
statically. The old symbol names continue to be supported, but cannot be used
for static builds. *)
external unload : t -> unit = "ml_g_io_module_unload"

(** Required API for GIO modules to implement.

This function is run after the module has been loaded into GIO,
to initialize the module. Typically, this function will call
g_io_extension_point_implement().

Since 2.56, this function should be named `g_io_<modulename>_load`, where
`modulename` is the plugin’s filename with the `lib` or `libgio` prefix and
everything after the first dot removed, and with `-` replaced with `_`
throughout. For example, `libgiognutls-helper.so` becomes `gnutls_helper`.
Using the new symbol names avoids name clashes when building modules
statically. The old symbol names continue to be supported, but cannot be used
for static builds. *)
external load : t -> unit = "ml_g_io_module_load"

