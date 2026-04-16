class type d_bus_property_info_t = object
  method ref : unit -> D_bus_property_info.t
  method unref : unit -> unit
  method as_d_bus_property_info : D_bus_property_info.t
end

(* High-level class for DBusPropertyInfo *)
class d_bus_property_info (obj : D_bus_property_info.t) : d_bus_property_info_t
  =
  object (self)
    method ref : unit -> D_bus_property_info.t =
      fun () -> D_bus_property_info.ref obj

    method unref : unit -> unit = fun () -> D_bus_property_info.unref obj
    method as_d_bus_property_info = obj
  end
