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

(* High-level class for IOExtension *)
class io_extension (obj : Raw.Io_extension.t) : io_extension_t =
  object (self)
    method get_name : unit -> string = fun () -> Raw.Io_extension.get_name obj

    method get_priority : unit -> int =
      fun () -> Raw.Io_extension.get_priority obj

    method get_type : unit -> Gobject.Type.t =
      fun () -> Raw.Io_extension.get_type obj

    method as_io_extension = obj
  end
