(** Provides an interface and default functions for loading and unloading
    modules. This is used internally to make GIO extensible, but can also be
    used by others to implement module loading.

    Its methods, signals and properties are on {!class-type-io_module_t}. The
    functions it is built on are in {!Ocgio.Raw.Io_module}. *)

(** The methods, signals and properties of a [GIOModule]. *)
class type io_module_t = object
  method as_io_module : Raw.Io_module.t
end

class io_module : Raw.Io_module.t -> io_module_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Io_module.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GIOModule], give one already wrapped. *)

val new_ : string -> io_module_t
