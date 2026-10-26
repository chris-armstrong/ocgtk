class type d_bus_connection_t = object
  inherit Async_initable.async_initable_t
  inherit Initable.initable_t

  method call_finish :
    Async_result.async_result_t -> (Gvariant.t, GError.t) result

  method call_sync :
    string option ->
    string ->
    string ->
    string ->
    Gvariant.t option ->
    Gvariant_type.t option ->
    Enums.dbuscallflags ->
    int ->
    Cancellable.cancellable_t option ->
    (Gvariant.t, GError.t) result

  method close_finish : Async_result.async_result_t -> (bool, GError.t) result

  method close_sync :
    Cancellable.cancellable_t option -> (bool, GError.t) result

  method emit_signal :
    string option ->
    string ->
    string ->
    string ->
    Gvariant.t option ->
    (bool, GError.t) result

  method export_action_group :
    string -> Action_group.action_group_t -> (int, GError.t) result

  method export_menu_model :
    string ->
    Menu_link_iter_and__menu_model.menu_model_t ->
    (int, GError.t) result

  method flush_finish : Async_result.async_result_t -> (bool, GError.t) result

  method flush_sync :
    Cancellable.cancellable_t option -> (bool, GError.t) result

  method get_capabilities : unit -> Enums.dbuscapabilityflags
  method get_exit_on_close : unit -> bool
  method get_flags : unit -> Enums.dbusconnectionflags
  method get_guid : unit -> string
  method get_last_serial : unit -> UInt32.t
  method get_peer_credentials : unit -> Credentials.credentials_t option
  method get_stream : unit -> Io_stream.io_stream_t
  method get_unique_name : unit -> string option
  method is_closed : unit -> bool
  method remove_filter : int -> unit

  method send_message_with_reply_finish :
    Async_result.async_result_t ->
    (D_bus_message.d_bus_message_t, GError.t) result

  method set_exit_on_close : bool -> unit
  method signal_unsubscribe : int -> unit
  method start_message_processing : unit -> unit
  method unexport_action_group : int -> unit
  method unexport_menu_model : int -> unit
  method unregister_object : int -> bool
  method unregister_subtree : int -> bool
  method as_d_bus_connection : Raw.D_bus_connection.t
end

(* High-level class for DBusConnection *)
class d_bus_connection (obj : Raw.D_bus_connection.t) : d_bus_connection_t =
  object (self)
    inherit Async_initable.async_initable (Raw.Async_initable.from_gobject obj)
    inherit Initable.initable (Raw.Initable.from_gobject obj)

    method call_finish :
        Async_result.async_result_t -> (Gvariant.t, GError.t) result =
      fun res ->
        let res = res#as_async_result in
        Raw.D_bus_connection.call_finish obj res

    method call_sync :
        string option ->
        string ->
        string ->
        string ->
        Gvariant.t option ->
        Gvariant_type.t option ->
        Enums.dbuscallflags ->
        int ->
        Cancellable.cancellable_t option ->
        (Gvariant.t, GError.t) result =
      fun bus_name object_path interface_name method_name parameters reply_type
          flags timeout_msec cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.D_bus_connection.call_sync obj bus_name object_path interface_name
          method_name parameters reply_type flags timeout_msec cancellable

    method close_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun res ->
        let res = res#as_async_result in
        Raw.D_bus_connection.close_finish obj res

    method close_sync :
        Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.D_bus_connection.close_sync obj cancellable

    method emit_signal :
        string option ->
        string ->
        string ->
        string ->
        Gvariant.t option ->
        (bool, GError.t) result =
      fun destination_bus_name object_path interface_name signal_name
          parameters ->
        Raw.D_bus_connection.emit_signal obj destination_bus_name object_path
          interface_name signal_name parameters

    method export_action_group :
        string -> Action_group.action_group_t -> (int, GError.t) result =
      fun object_path action_group ->
        let action_group = action_group#as_action_group in
        Raw.D_bus_connection.export_action_group obj object_path action_group

    method export_menu_model :
        string ->
        Menu_link_iter_and__menu_model.menu_model_t ->
        (int, GError.t) result =
      fun object_path menu ->
        let menu = menu#as_menu_model in
        Raw.D_bus_connection.export_menu_model obj object_path menu

    method flush_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun res ->
        let res = res#as_async_result in
        Raw.D_bus_connection.flush_finish obj res

    method flush_sync :
        Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.D_bus_connection.flush_sync obj cancellable

    method get_capabilities : unit -> Enums.dbuscapabilityflags =
      fun () -> Raw.D_bus_connection.get_capabilities obj

    method get_exit_on_close : unit -> bool =
      fun () -> Raw.D_bus_connection.get_exit_on_close obj

    method get_flags : unit -> Enums.dbusconnectionflags =
      fun () -> Raw.D_bus_connection.get_flags obj

    method get_guid : unit -> string =
      fun () -> Raw.D_bus_connection.get_guid obj

    method get_last_serial : unit -> UInt32.t =
      fun () -> Raw.D_bus_connection.get_last_serial obj

    method get_peer_credentials : unit -> Credentials.credentials_t option =
      fun () ->
        Option.map
          (fun ret -> new Credentials.credentials ret)
          (Raw.D_bus_connection.get_peer_credentials obj)

    method get_stream : unit -> Io_stream.io_stream_t =
      fun () -> new Io_stream.io_stream (Raw.D_bus_connection.get_stream obj)

    method get_unique_name : unit -> string option =
      fun () -> Raw.D_bus_connection.get_unique_name obj

    method is_closed : unit -> bool =
      fun () -> Raw.D_bus_connection.is_closed obj

    method remove_filter : int -> unit =
      fun filter_id -> Raw.D_bus_connection.remove_filter obj filter_id

    method send_message_with_reply_finish :
        Async_result.async_result_t ->
        (D_bus_message.d_bus_message_t, GError.t) result =
      fun res ->
        let res = res#as_async_result in
        Result.map
          (fun ret -> new D_bus_message.d_bus_message ret)
          (Raw.D_bus_connection.send_message_with_reply_finish obj res)

    method set_exit_on_close : bool -> unit =
      fun exit_on_close ->
        Raw.D_bus_connection.set_exit_on_close obj exit_on_close

    method signal_unsubscribe : int -> unit =
      fun subscription_id ->
        Raw.D_bus_connection.signal_unsubscribe obj subscription_id

    method start_message_processing : unit -> unit =
      fun () -> Raw.D_bus_connection.start_message_processing obj

    method unexport_action_group : int -> unit =
      fun export_id -> Raw.D_bus_connection.unexport_action_group obj export_id

    method unexport_menu_model : int -> unit =
      fun export_id -> Raw.D_bus_connection.unexport_menu_model obj export_id

    method unregister_object : int -> bool =
      fun registration_id ->
        Raw.D_bus_connection.unregister_object obj registration_id

    method unregister_subtree : int -> bool =
      fun registration_id ->
        Raw.D_bus_connection.unregister_subtree obj registration_id

    method as_d_bus_connection = obj
  end

let new_finish (res : Async_result.async_result_t) :
    (d_bus_connection_t, GError.t) result =
  let res = res#as_async_result in
  let obj_ = Raw.D_bus_connection.new_finish res in
  Result.map (fun obj_ -> new d_bus_connection obj_) obj_

let new_for_address_finish (res : Async_result.async_result_t) :
    (d_bus_connection_t, GError.t) result =
  let res = res#as_async_result in
  let obj_ = Raw.D_bus_connection.new_for_address_finish res in
  Result.map (fun obj_ -> new d_bus_connection obj_) obj_

let new_for_address_sync (address : string) (flags : Enums.dbusconnectionflags)
    (observer : D_bus_auth_observer.d_bus_auth_observer_t option)
    (cancellable : Cancellable.cancellable_t option) :
    (d_bus_connection_t, GError.t) result =
  let observer = Option.map (fun c -> c#as_d_bus_auth_observer) observer in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ =
    Raw.D_bus_connection.new_for_address_sync address flags observer cancellable
  in
  Result.map (fun obj_ -> new d_bus_connection obj_) obj_

let new_sync (stream : Io_stream.io_stream_t) (guid : string option)
    (flags : Enums.dbusconnectionflags)
    (observer : D_bus_auth_observer.d_bus_auth_observer_t option)
    (cancellable : Cancellable.cancellable_t option) :
    (d_bus_connection_t, GError.t) result =
  let stream = stream#as_io_stream in
  let observer = Option.map (fun c -> c#as_d_bus_auth_observer) observer in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ =
    Raw.D_bus_connection.new_sync stream guid flags observer cancellable
  in
  Result.map (fun obj_ -> new d_bus_connection obj_) obj_
