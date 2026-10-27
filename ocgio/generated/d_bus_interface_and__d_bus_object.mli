(** The classes of {!Ocgio.D_bus_interface}, {!Ocgio.D_bus_object}, defined
    together because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [GDBusInterface]. *)
class type d_bus_interface_t = object
  method dup_object : unit -> d_bus_object_t option
  method get_info : unit -> Raw.D_bus_interface_info.t
  method set_object : d_bus_object_t option -> unit
  method as_d_bus_interface : Raw.D_bus_interface.t
end

(** The methods, signals and properties of a [GDBusObject]. *)
and d_bus_object_t = object
  method on_interface_added :
    ?after:bool ->
    callback:(interface:d_bus_interface_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_interface_removed :
    ?after:bool ->
    callback:(interface:d_bus_interface_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_interface : string -> d_bus_interface_t option
  method get_interfaces : unit -> d_bus_interface_t list
  method get_object_path : unit -> string
  method as_d_bus_object : Raw.D_bus_object.t
end

(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_interface.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GDBusInterface], give one already wrapped. *)
class d_bus_interface : Raw.D_bus_interface.t -> d_bus_interface_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_object.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GDBusObject], give one already wrapped. *)

and d_bus_object : Raw.D_bus_object.t -> d_bus_object_t
