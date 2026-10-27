(** Information about a D-Bus interface.

    Its methods, signals and properties are on
    {!class-type-d_bus_interface_info_t}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_interface_info}. *)

(** The methods, signals and properties of a [GDBusInterfaceInfo]. *)
class type d_bus_interface_info_t = object
  method cache_build : unit -> unit
  method cache_release : unit -> unit
  method lookup_method : string -> Raw.D_bus_method_info.t option
  method lookup_property : string -> Raw.D_bus_property_info.t option
  method lookup_signal : string -> Raw.D_bus_signal_info.t option
  method ref : unit -> Raw.D_bus_interface_info.t
  method as_d_bus_interface_info : Raw.D_bus_interface_info.t
end

class d_bus_interface_info :
  Raw.D_bus_interface_info.t ->
  d_bus_interface_info_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_interface_info.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GDBusInterfaceInfo], give one already wrapped. *)
