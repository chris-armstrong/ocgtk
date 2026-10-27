(** Information about a method on a D-Bus interface.

    Its methods, signals and properties are on
    {!class-type-d_bus_method_info_t}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_method_info}. *)

(** The methods, signals and properties of a [GDBusMethodInfo]. *)
class type d_bus_method_info_t = object
  method ref : unit -> Raw.D_bus_method_info.t
  method as_d_bus_method_info : Raw.D_bus_method_info.t
end

class d_bus_method_info : Raw.D_bus_method_info.t -> d_bus_method_info_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_method_info.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GDBusMethodInfo], give one already wrapped. *)
