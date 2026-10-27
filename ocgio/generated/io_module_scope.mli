(** Represents a scope for loading IO modules. A scope can be used for blocking
    duplicate modules, or blocking a module you don't want to load.

    The scope can be used with g_io_modules_load_all_in_directory_with_scope()
    or g_io_modules_scan_all_in_directory_with_scope().

    Its methods, signals and properties are on {!class-type-io_module_scope_t}.
    The functions it is built on are in {!Ocgio.Raw.Io_module_scope}. *)

(** The methods, signals and properties of a [GIOModuleScope]. *)
class type io_module_scope_t = object
  method block : string -> unit
  (** Block modules with the given [basename] from being loaded when this scope
      is used with g_io_modules_scan_all_in_directory_with_scope() or
      g_io_modules_load_all_in_directory_with_scope(). *)

  method as_io_module_scope : Raw.Io_module_scope.t
end

class io_module_scope : Raw.Io_module_scope.t -> io_module_scope_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Io_module_scope.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GIOModuleScope], give one already wrapped. *)
