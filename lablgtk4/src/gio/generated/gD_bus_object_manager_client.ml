(* Signal class defined in gd_bus_object_manager_client_signals.ml *)

(* High-level class for DBusObjectManagerClient *)
class d_bus_object_manager_client (obj : D_bus_object_manager_client.t) = object (self)
  inherit Gd_bus_object_manager_client_signals.d_bus_object_manager_client_signals obj

  method get_connection : unit -> GD_bus_connection.d_bus_connection =
    fun () ->
      new  GD_bus_connection.d_bus_connection(D_bus_object_manager_client.get_connection obj)

  method get_flags : unit -> Gio_enums.dbusobjectmanagerclientflags =
    fun () ->
      (D_bus_object_manager_client.get_flags obj)

  method get_name : unit -> string =
    fun () ->
      (D_bus_object_manager_client.get_name obj)

  method get_name_owner : unit -> string option =
    fun () ->
      (D_bus_object_manager_client.get_name_owner obj)

  method bus_type = D_bus_object_manager_client.get_bus_type obj

  method object_path = D_bus_object_manager_client.get_object_path obj

    method as_d_bus_object_manager_client = obj
end

