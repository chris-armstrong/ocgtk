class type d_bus_error_entry_t = object
  method as_d_bus_error_entry : Raw.D_bus_error_entry.t
end

(* High-level class for DBusErrorEntry *)
class d_bus_error_entry (obj : Raw.D_bus_error_entry.t) : d_bus_error_entry_t =
  object (self)
    method as_d_bus_error_entry = obj
  end
