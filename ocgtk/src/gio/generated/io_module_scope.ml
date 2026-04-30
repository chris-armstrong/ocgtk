(* GENERATED CODE - DO NOT EDIT *)
(* IOModuleScope: IOModuleScope *)

type t = [ `io_module_scope ] Gobject.obj
(** Represents a scope for loading IO modules. A scope can be used for blocking
    duplicate modules, or blocking a module you don't want to load.

    The scope can be used with g_io_modules_load_all_in_directory_with_scope()
    or g_io_modules_scan_all_in_directory_with_scope(). *)

(* Methods *)

external block : t -> string -> unit = "ml_g_io_module_scope_block"
(** Block modules with the given @basename from being loaded when
this scope is used with g_io_modules_scan_all_in_directory_with_scope()
or g_io_modules_load_all_in_directory_with_scope(). *)
