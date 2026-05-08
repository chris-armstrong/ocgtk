class type d_bus_object_manager_client_t = object
  inherit GAsync_initable.async_initable_t
  inherit GD_bus_object_manager.d_bus_object_manager_t
  inherit GInitable.initable_t
  method get_connection : unit -> GD_bus_connection.d_bus_connection_t
  method get_flags : unit -> Gio_enums.dbusobjectmanagerclientflags
  method get_name : unit -> string
  method get_name_owner : unit -> string option
  method object_path : string
  method as_d_bus_object_manager_client : D_bus_object_manager_client.t
end

(* High-level class for DBusObjectManagerClient *)
class d_bus_object_manager_client (obj : D_bus_object_manager_client.t) :
  d_bus_object_manager_client_t =
  object (self)
    inherit GAsync_initable.async_initable (Async_initable.from_gobject obj)

    inherit
      GD_bus_object_manager.d_bus_object_manager
        (D_bus_object_manager.from_gobject obj)

    inherit GInitable.initable (Initable.from_gobject obj)

    method get_connection : unit -> GD_bus_connection.d_bus_connection_t =
      fun () ->
        new GD_bus_connection.d_bus_connection
          (D_bus_object_manager_client.get_connection obj)

    method get_flags : unit -> Gio_enums.dbusobjectmanagerclientflags =
      fun () -> D_bus_object_manager_client.get_flags obj

    method get_name : unit -> string =
      fun () -> D_bus_object_manager_client.get_name obj

    method get_name_owner : unit -> string option =
      fun () -> D_bus_object_manager_client.get_name_owner obj

    method object_path = D_bus_object_manager_client.get_object_path obj
    method as_d_bus_object_manager_client = obj
  end

let new_finish (res : GAsync_result.async_result_t) :
    (d_bus_object_manager_client_t, GError.t) result =
  let res = res#as_async_result in
  let obj_ = D_bus_object_manager_client.new_finish res in
  Result.map (fun obj_ -> new d_bus_object_manager_client obj_) obj_

let new_for_bus_finish (res : GAsync_result.async_result_t) :
    (d_bus_object_manager_client_t, GError.t) result =
  let res = res#as_async_result in
  let obj_ = D_bus_object_manager_client.new_for_bus_finish res in
  Result.map (fun obj_ -> new d_bus_object_manager_client obj_) obj_
