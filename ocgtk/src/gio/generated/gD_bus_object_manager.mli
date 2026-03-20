class type d_bus_object_manager_t = object
    inherit Gd_bus_object_manager_signals.d_bus_object_manager_signals
    method get_interface : string -> string -> GD_bus_interface_and__d_bus_object.d_bus_interface_t option
    method get_object : string -> GD_bus_interface_and__d_bus_object.d_bus_object_t option
    method get_object_path : unit -> string
    method as_d_bus_object_manager : D_bus_object_manager.t
end

class d_bus_object_manager : D_bus_object_manager.t -> d_bus_object_manager_t

