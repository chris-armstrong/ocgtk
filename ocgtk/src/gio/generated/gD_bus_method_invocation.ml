class type d_bus_method_invocation_t = object
    method get_connection : unit -> GD_bus_connection.d_bus_connection_t
    method get_interface_name : unit -> string
    method get_message : unit -> GD_bus_message.d_bus_message_t
    method get_method_info : unit -> D_bus_method_info.t option
    method get_method_name : unit -> string
    method get_object_path : unit -> string
    method get_parameters : unit -> Gvariant.t
    method get_property_info : unit -> D_bus_property_info.t option
    method get_sender : unit -> string
    method return_dbus_error : string -> string -> unit
    method return_value : Gvariant.t option -> unit
    method return_value_with_unix_fd_list : Gvariant.t option -> GUnix_fd_list.unix_fd_list_t option -> unit
    method as_d_bus_method_invocation : D_bus_method_invocation.t
end

(* High-level class for DBusMethodInvocation *)
class d_bus_method_invocation (obj : D_bus_method_invocation.t) : d_bus_method_invocation_t = object (self)

  method get_connection : unit -> GD_bus_connection.d_bus_connection_t =
    fun () ->
      new  GD_bus_connection.d_bus_connection(D_bus_method_invocation.get_connection obj)

  method get_interface_name : unit -> string =
    fun () ->
      (D_bus_method_invocation.get_interface_name obj)

  method get_message : unit -> GD_bus_message.d_bus_message_t =
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

  method get_parameters : unit -> Gvariant.t =
    fun () ->
      (D_bus_method_invocation.get_parameters obj)

  method get_property_info : unit -> D_bus_property_info.t option =
    fun () ->
      (D_bus_method_invocation.get_property_info obj)

  method get_sender : unit -> string =
    fun () ->
      (D_bus_method_invocation.get_sender obj)

  method return_dbus_error : string -> string -> unit =
    fun error_name error_message ->
      (D_bus_method_invocation.return_dbus_error obj error_name error_message)

  method return_value : Gvariant.t option -> unit =
    fun parameters ->
      (D_bus_method_invocation.return_value obj parameters)

  method return_value_with_unix_fd_list : Gvariant.t option -> GUnix_fd_list.unix_fd_list_t option -> unit =
    fun parameters fd_list ->
      let fd_list = Option.map (fun (c) -> c#as_unix_fd_list) fd_list in
      (D_bus_method_invocation.return_value_with_unix_fd_list obj parameters fd_list)

    method as_d_bus_method_invocation = obj
end

