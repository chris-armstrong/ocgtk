class type d_bus_arg_info_t = object
  method ref : unit -> D_bus_arg_info.t
  method as_d_bus_arg_info : D_bus_arg_info.t
end

(* High-level class for DBusArgInfo *)
class d_bus_arg_info (obj : D_bus_arg_info.t) : d_bus_arg_info_t =
  object (self)
    method ref : unit -> D_bus_arg_info.t = fun () -> D_bus_arg_info.ref obj
    method as_d_bus_arg_info = obj
  end
