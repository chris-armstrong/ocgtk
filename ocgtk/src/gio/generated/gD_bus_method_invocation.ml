(* High-level class for DBusMethodInvocation *)
class d_bus_method_invocation (obj : D_bus_method_invocation.t) = object (self)

  method get_connection : unit -> GD_bus_connection.d_bus_connection =
    fun () ->
      new  GD_bus_connection.d_bus_connection(D_bus_method_invocation.get_connection obj)

  method get_interface_name : unit -> string =
    fun () ->
      (D_bus_method_invocation.get_interface_name obj)

  method get_message : unit -> GD_bus_message.d_bus_message =
    fun () ->
      new  GD_bus_message.d_bus_message(D_bus_method_invocation.get_message obj)

  method get_method_info : unit -> D_bus_method_info.t option =
    fun () ->
      (D_bus_method_invocation.get_method_info obj)

  method get_method_name : unit -> string =
    fun () ->
      (D_bus_method_invocation.get_method_name obj)

  method get_object_path : unit -> string =
    fun () ->
      (D_bus_method_invocation.get_object_path obj)

  method get_property_info : unit -> D_bus_property_info.t option =
    fun () ->
      (D_bus_method_invocation.get_property_info obj)

  method get_sender : unit -> string =
    fun () ->
      (D_bus_method_invocation.get_sender obj)

  method return_dbus_error : string -> string -> unit =
    fun error_name error_message ->
      (D_bus_method_invocation.return_dbus_error obj error_name error_message)

    method as_d_bus_method_invocation = obj
end

