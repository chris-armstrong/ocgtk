class type d_bus_interface_info_t = object
  method cache_build : unit -> unit
  method cache_release : unit -> unit
  method lookup_method : string -> D_bus_method_info.t option
  method lookup_property : string -> D_bus_property_info.t option
  method lookup_signal : string -> D_bus_signal_info.t option
  method ref : unit -> D_bus_interface_info.t
  method as_d_bus_interface_info : D_bus_interface_info.t
end

(* High-level class for DBusInterfaceInfo *)
class d_bus_interface_info (obj : D_bus_interface_info.t) :
  d_bus_interface_info_t =
  object (self)
    method cache_build : unit -> unit =
      fun () -> D_bus_interface_info.cache_build obj

    method cache_release : unit -> unit =
      fun () -> D_bus_interface_info.cache_release obj

    method lookup_method : string -> D_bus_method_info.t option =
      fun name -> D_bus_interface_info.lookup_method obj name

    method lookup_property : string -> D_bus_property_info.t option =
      fun name -> D_bus_interface_info.lookup_property obj name

    method lookup_signal : string -> D_bus_signal_info.t option =
      fun name -> D_bus_interface_info.lookup_signal obj name

    method ref : unit -> D_bus_interface_info.t =
      fun () -> D_bus_interface_info.ref obj

    method as_d_bus_interface_info = obj
  end
