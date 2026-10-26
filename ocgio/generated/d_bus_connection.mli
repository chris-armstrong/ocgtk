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

class d_bus_connection : Raw.D_bus_connection.t -> d_bus_connection_t

val new_finish :
  Async_result.async_result_t -> (d_bus_connection_t, GError.t) result

val new_for_address_finish :
  Async_result.async_result_t -> (d_bus_connection_t, GError.t) result

val new_for_address_sync :
  string ->
  Enums.dbusconnectionflags ->
  D_bus_auth_observer.d_bus_auth_observer_t option ->
  Cancellable.cancellable_t option ->
  (d_bus_connection_t, GError.t) result

val new_sync :
  Io_stream.io_stream_t ->
  string option ->
  Enums.dbusconnectionflags ->
  D_bus_auth_observer.d_bus_auth_observer_t option ->
  Cancellable.cancellable_t option ->
  (d_bus_connection_t, GError.t) result
