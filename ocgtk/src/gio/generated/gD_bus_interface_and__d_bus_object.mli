
class d_bus_interface : D_bus_interface_and__d_bus_object.D_bus_interface.t ->
  object
    method dup_object : unit -> d_bus_object option
    method get_info : unit -> D_bus_interface_info.t
    method get_object : unit -> d_bus_object option
    method as_d_bus_interface : D_bus_interface_and__d_bus_object.D_bus_interface.t
  end

and d_bus_object : D_bus_interface_and__d_bus_object.D_bus_object.t ->
  object
    inherit Gd_bus_object_signals.d_bus_object_signals
    method get_interface : string -> d_bus_interface option
    method get_object_path : unit -> string
    method as_d_bus_object : D_bus_interface_and__d_bus_object.D_bus_object.t
  end
