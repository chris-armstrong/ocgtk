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

class d_bus_object_manager_server : D_bus_object_manager_server.t -> d_bus_object_manager_server_t

val new_ : string -> d_bus_object_manager_server_t
