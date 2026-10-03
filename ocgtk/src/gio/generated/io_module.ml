(* GENERATED CODE - DO NOT EDIT *)
(* IOModule: IOModule *)

type t = [ `io_module | `type_module ] Gobject.obj
(** Provides an interface and default functions for loading and unloading
    modules. This is used internally to make GIO extensible, but can also be
    used by others to implement module loading. *)

external new_ : string -> t = "ml_g_io_module_new"
(** Create a new IOModule *)

(* Methods *)
