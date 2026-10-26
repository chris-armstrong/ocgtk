class type d_bus_method_info_t = object
  method ref : unit -> Raw.D_bus_method_info.t
  method as_d_bus_method_info : Raw.D_bus_method_info.t
end

(* High-level class for DBusMethodInfo *)
class d_bus_method_info (obj : Raw.D_bus_method_info.t) : d_bus_method_info_t =
  object (self)
    method ref : unit -> Raw.D_bus_method_info.t =
      fun () -> Raw.D_bus_method_info.ref obj

    method as_d_bus_method_info = obj
  end
