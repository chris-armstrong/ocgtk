class type d_bus_error_entry_t = object
  method as_d_bus_error_entry : D_bus_error_entry.t
end

class d_bus_error_entry : D_bus_error_entry.t -> d_bus_error_entry_t
