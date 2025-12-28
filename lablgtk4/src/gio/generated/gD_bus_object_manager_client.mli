class d_bus_object_manager_client : D_bus_object_manager_client.t ->
  object
    inherit Gd_bus_object_manager_client_signals.d_bus_object_manager_client_signals
    method get_connection : unit -> GD_bus_connection.d_bus_connection
    method get_flags : unit -> Gio_enums.dbusobjectmanagerclientflags
    method get_name : unit -> string
    method get_name_owner : unit -> string option
    method bus_type : Gio_enums.bustype
    method object_path : string
    method as_d_bus_object_manager_client : D_bus_object_manager_client.t
  end

