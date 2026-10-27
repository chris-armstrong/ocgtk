class type d_bus_object_manager_client_t = object
  inherit Async_initable.async_initable_t
  inherit D_bus_object_manager.d_bus_object_manager_t
  inherit Initable.initable_t

  method on_interface_proxy_signal :
    ?after:bool ->
    callback:
      (object_proxy:D_bus_object_proxy.d_bus_object_proxy_t ->
      interface_proxy:D_bus_proxy.d_bus_proxy_t ->
      sender_name:string ->
      signal_name:string ->
      parameters:Gvariant.t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a D-Bus signal is received on [interface_proxy].

      This signal exists purely as a convenience to avoid having to connect
      signals to all interface proxies managed by [manager].

      This signal is emitted in the thread-default main context (see
      [GLib.MainContext.push_thread_default]) that [manager] was constructed in.
  *)

  method get_connection : unit -> D_bus_connection.d_bus_connection_t
  (** Gets the [GDBusConnection] used by [manager]. *)

  method get_flags : unit -> Enums.dbusobjectmanagerclientflags
  (** Gets the flags that [manager] was constructed with. *)

  method get_name : unit -> string
  (** Gets the name that [manager] is for, or [NULL] if not a message bus
      connection. *)

  method get_name_owner : unit -> string option
  (** The unique name that owns the name that [manager] is for or [NULL] if
      no-one currently owns that name. You can connect to the [GObject::notify]
      signal to track changes to the [GDBusObjectManagerClient:name]-owner
      property. *)

  method object_path : string
  method as_d_bus_object_manager_client : Raw.D_bus_object_manager_client.t
end

(* High-level class for DBusObjectManagerClient *)
class d_bus_object_manager_client (obj : Raw.D_bus_object_manager_client.t) :
  d_bus_object_manager_client_t =
  object (self)
    inherit Async_initable.async_initable (Raw.Async_initable.from_gobject obj)

    inherit
      D_bus_object_manager.d_bus_object_manager
        (Raw.D_bus_object_manager.from_gobject obj)

    inherit Initable.initable (Raw.Initable.from_gobject obj)

    method on_interface_proxy_signal ?(after = false) ~callback () =
      Raw.D_bus_object_manager_client.on_interface_proxy_signal ~after
        self#as_d_bus_object_manager_client
        ~callback:(fun
            ~object_proxy
            ~interface_proxy
            ~sender_name
            ~signal_name
            ~parameters
          ->
          callback
            ~object_proxy:
              (new D_bus_object_proxy.d_bus_object_proxy object_proxy)
            ~interface_proxy:(new D_bus_proxy.d_bus_proxy interface_proxy)
            ~sender_name ~signal_name ~parameters)

    method get_connection : unit -> D_bus_connection.d_bus_connection_t =
      fun () ->
        new D_bus_connection.d_bus_connection
          (Raw.D_bus_object_manager_client.get_connection obj)

    method get_flags : unit -> Enums.dbusobjectmanagerclientflags =
      fun () -> Raw.D_bus_object_manager_client.get_flags obj

    method get_name : unit -> string =
      fun () -> Raw.D_bus_object_manager_client.get_name obj

    method get_name_owner : unit -> string option =
      fun () -> Raw.D_bus_object_manager_client.get_name_owner obj

    method object_path = Raw.D_bus_object_manager_client.get_object_path obj
    method as_d_bus_object_manager_client = obj
  end

let new_finish (res : Async_result.async_result_t) :
    (d_bus_object_manager_client_t, GError.t) result =
  let res = res#as_async_result in
  let obj_ = Raw.D_bus_object_manager_client.new_finish res in
  Result.map (fun obj_ -> new d_bus_object_manager_client obj_) obj_

let new_for_bus_finish (res : Async_result.async_result_t) :
    (d_bus_object_manager_client_t, GError.t) result =
  let res = res#as_async_result in
  let obj_ = Raw.D_bus_object_manager_client.new_for_bus_finish res in
  Result.map (fun obj_ -> new d_bus_object_manager_client obj_) obj_
