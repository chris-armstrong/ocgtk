class type d_bus_error_entry_t = object
  method get_error_code : int
  method set_error_code : int -> unit
  method get_dbus_error_name : string
  method set_dbus_error_name : string -> unit
  method as_d_bus_error_entry : D_bus_error_entry.t
end

(* High-level class for DBusErrorEntry *)
class d_bus_error_entry (obj : D_bus_error_entry.t) : d_bus_error_entry_t =
  object (self)
    method get_error_code : int = D_bus_error_entry.get_error_code obj

    method set_error_code : int -> unit =
      fun v -> D_bus_error_entry.set_error_code obj v

    method get_dbus_error_name : string =
      D_bus_error_entry.get_dbus_error_name obj

    method set_dbus_error_name : string -> unit =
      fun v -> D_bus_error_entry.set_dbus_error_name obj v

    method as_d_bus_error_entry = obj
  end

let make (error_code : int) (dbus_error_name : string) : d_bus_error_entry_t =
  new d_bus_error_entry (D_bus_error_entry.make error_code dbus_error_name)
