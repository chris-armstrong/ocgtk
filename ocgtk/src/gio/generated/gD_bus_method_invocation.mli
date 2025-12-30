class d_bus_method_invocation : D_bus_method_invocation.t ->
  object
    method get_connection : unit -> GD_bus_connection.d_bus_connection
    method get_interface_name : unit -> string
    method get_message : unit -> GD_bus_message.d_bus_message
    method get_method_info : unit -> D_bus_method_info.t option
    method get_method_name : unit -> string
    method get_object_path : unit -> string
    method get_property_info : unit -> D_bus_property_info.t option
    method get_sender : unit -> string
    method return_dbus_error : string -> string -> unit
    method as_d_bus_method_invocation : D_bus_method_invocation.t
  end

