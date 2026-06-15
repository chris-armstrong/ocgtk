class type d_bus_error_entry_t = object
  method get_error_code : int
  method set_error_code : int -> unit
  method get_dbus_error_name : string
  method set_dbus_error_name : string -> unit
  method as_d_bus_error_entry : D_bus_error_entry.t
end

class d_bus_error_entry : D_bus_error_entry.t -> d_bus_error_entry_t

val make : int -> string -> d_bus_error_entry_t
