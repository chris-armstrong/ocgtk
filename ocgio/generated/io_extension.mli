(** [GIOExtension] is an opaque data structure and can only be accessed using
    the following functions.

    Its methods, signals and properties are on {!class-type-io_extension_t}. The
    functions it is built on are in {!Ocgio.Raw.Io_extension}. *)

(** The methods, signals and properties of a [GIOExtension]. *)
class type io_extension_t = object
  method get_name : unit -> string
  (** Gets the name under which [extension] was registered.

      Note that the same type may be registered as extension for multiple
      extension points, under different names. *)

  method get_priority : unit -> int
  (** Gets the priority with which [extension] was registered. *)

  method get_type : unit -> Gobject.Type.t
  (** Gets the type associated with [extension]. *)

  method as_io_extension : Raw.Io_extension.t
end

class io_extension : Raw.Io_extension.t -> io_extension_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Io_extension.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GIOExtension], give one already wrapped. *)
