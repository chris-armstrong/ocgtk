(* GENERATED CODE - DO NOT EDIT *)
(* IOExtension: IOExtension *)

type t = [ `io_extension ] Gobject.obj
(** #GIOExtension is an opaque data structure and can only be accessed using the
    following functions. *)

(* Methods *)

external get_type : t -> int = "ml_g_io_extension_get_type"
(** Gets the type associated with @extension. *)

external get_priority : t -> int = "ml_g_io_extension_get_priority"
(** Gets the priority with which @extension was registered. *)

external get_name : t -> string = "ml_g_io_extension_get_name"
(** Gets the name under which @extension was registered.

Note that the same type may be registered as extension
for multiple extension points, under different names. *)
