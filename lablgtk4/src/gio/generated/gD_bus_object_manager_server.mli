class d_bus_object_manager_server : D_bus_object_manager_server.t ->
  object
    method export : #GD_bus_object_skeleton.d_bus_object_skeleton -> unit
    method export_uniquely : #GD_bus_object_skeleton.d_bus_object_skeleton -> unit
    method get_connection : unit -> GD_bus_connection.d_bus_connection option
    method is_exported : #GD_bus_object_skeleton.d_bus_object_skeleton -> bool
    method set_connection : #GD_bus_connection.d_bus_connection option -> unit
    method unexport : string -> bool
    method object_path : string
    method as_d_bus_object_manager_server : D_bus_object_manager_server.t
  end

