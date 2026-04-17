class type d_bus_object_manager_server_t = object
    inherit GD_bus_object_manager.d_bus_object_manager_t
    method export : GD_bus_object_skeleton.d_bus_object_skeleton_t -> unit
    method export_uniquely : GD_bus_object_skeleton.d_bus_object_skeleton_t -> unit
    method get_connection : unit -> GD_bus_connection.d_bus_connection_t option
    method is_exported : GD_bus_object_skeleton.d_bus_object_skeleton_t -> bool
    method set_connection : GD_bus_connection.d_bus_connection_t option -> unit
    method unexport : string -> bool
    method object_path : string
    method as_d_bus_object_manager_server : D_bus_object_manager_server.t
end

(* High-level class for DBusObjectManagerServer *)
class d_bus_object_manager_server (obj : D_bus_object_manager_server.t) : d_bus_object_manager_server_t = object (self)
  inherit GD_bus_object_manager.d_bus_object_manager (D_bus_object_manager.from_gobject obj)

  method export : GD_bus_object_skeleton.d_bus_object_skeleton_t -> unit =
    fun object_ ->
      let object_ = object_#as_d_bus_object_skeleton in
      (D_bus_object_manager_server.export obj object_)

  method export_uniquely : GD_bus_object_skeleton.d_bus_object_skeleton_t -> unit =
    fun object_ ->
      let object_ = object_#as_d_bus_object_skeleton in
      (D_bus_object_manager_server.export_uniquely obj object_)

  method get_connection : unit -> GD_bus_connection.d_bus_connection_t option =
    fun () ->
      Option.map (fun ret -> new GD_bus_connection.d_bus_connection ret) (D_bus_object_manager_server.get_connection obj)

  method is_exported : GD_bus_object_skeleton.d_bus_object_skeleton_t -> bool =
    fun object_ ->
      let object_ = object_#as_d_bus_object_skeleton in
      (D_bus_object_manager_server.is_exported obj object_)

  method set_connection : GD_bus_connection.d_bus_connection_t option -> unit =
    fun connection ->
      let connection = Option.map (fun (c) -> c#as_d_bus_connection) connection in
      (D_bus_object_manager_server.set_connection obj connection)

  method unexport : string -> bool =
    fun object_path ->
      (D_bus_object_manager_server.unexport obj object_path)

  method object_path = D_bus_object_manager_server.get_object_path obj

    method as_d_bus_object_manager_server = obj
end

let new_ (object_path : string) : d_bus_object_manager_server_t =
  let obj_ = D_bus_object_manager_server.new_ object_path in
  new d_bus_object_manager_server obj_

