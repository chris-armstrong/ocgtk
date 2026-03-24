class type d_bus_object_manager_client_t = object
    inherit Gd_bus_object_manager_client_signals.d_bus_object_manager_client_signals
    method get_connection : unit -> GD_bus_connection.d_bus_connection_t
    method get_flags : unit -> Gio_enums.dbusobjectmanagerclientflags
    method get_name : unit -> string
    method get_name_owner : unit -> string option
    method bus_type : Gio_enums.bustype
    method object_path : string
    method as_d_bus_object_manager_client : D_bus_object_manager_client.t
end

class d_bus_object_manager_client : D_bus_object_manager_client.t -> d_bus_object_manager_client_t

val new_finish : GAsync_result.async_result_t -> (d_bus_object_manager_client_t, GError.t) result
val new_for_bus_finish : GAsync_result.async_result_t -> (d_bus_object_manager_client_t, GError.t) result
