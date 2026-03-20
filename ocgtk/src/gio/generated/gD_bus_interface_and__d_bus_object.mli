
class type d_bus_interface_t = object
    method dup_object : unit -> d_bus_object_t option
    method get_info : unit -> D_bus_interface_info.t
    method as_d_bus_interface : D_bus_interface_and__d_bus_object.D_bus_interface.t
end

and d_bus_object_t = object
    inherit Gd_bus_object_signals.d_bus_object_signals
    method get_interface : string -> d_bus_interface_t option
    method get_object_path : unit -> string
    method as_d_bus_object : D_bus_interface_and__d_bus_object.D_bus_object.t
end


class d_bus_interface : D_bus_interface_and__d_bus_object.D_bus_interface.t -> d_bus_interface_t

and d_bus_object : D_bus_interface_and__d_bus_object.D_bus_object.t -> d_bus_object_t
