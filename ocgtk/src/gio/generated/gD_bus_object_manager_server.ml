(* High-level class for DBusObjectManagerServer *)
class d_bus_object_manager_server (obj : D_bus_object_manager_server.t) = object (self)

  method export : 'p1. (#GD_bus_object_skeleton.d_bus_object_skeleton as 'p1) -> unit =
    fun object_ ->
      let object_ = object_#as_d_bus_object_skeleton in
      (D_bus_object_manager_server.export obj object_)

  method export_uniquely : 'p1. (#GD_bus_object_skeleton.d_bus_object_skeleton as 'p1) -> unit =
    fun object_ ->
      let object_ = object_#as_d_bus_object_skeleton in
      (D_bus_object_manager_server.export_uniquely obj object_)

  method get_connection : unit -> GD_bus_connection.d_bus_connection option =
    fun () ->
      Option.map (fun ret -> new GD_bus_connection.d_bus_connection ret) (D_bus_object_manager_server.get_connection obj)

  method is_exported : 'p1. (#GD_bus_object_skeleton.d_bus_object_skeleton as 'p1) -> bool =
    fun object_ ->
      let object_ = object_#as_d_bus_object_skeleton in
      (D_bus_object_manager_server.is_exported obj object_)

  method set_connection : 'p1. (#GD_bus_connection.d_bus_connection as 'p1) option -> unit =
    fun connection ->
      let connection = Option.map (fun (c) -> c#as_d_bus_connection) connection in
      (D_bus_object_manager_server.set_connection obj connection)

  method unexport : string -> bool =
    fun object_path ->
      (D_bus_object_manager_server.unexport obj object_path)

  method object_path = D_bus_object_manager_server.get_object_path obj

    method as_d_bus_object_manager_server = obj
end

