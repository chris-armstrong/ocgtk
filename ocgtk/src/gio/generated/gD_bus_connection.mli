class type d_bus_connection_t = object
  inherit GAsync_initable.async_initable_t
  inherit GInitable.initable_t
  inherit Gd_bus_connection_signals.d_bus_connection_signals

  method call_finish :
    GAsync_result.async_result_t -> (Gvariant.t, GError.t) result

  method call_sync :
    string option ->
    string ->
    string ->
    string ->
    Gvariant.t option ->
    Gvariant_type.t option ->
    Gio_enums.dbuscallflags ->
    int ->
    GCancellable.cancellable_t option ->
    (Gvariant.t, GError.t) result

  method close_finish : GAsync_result.async_result_t -> (bool, GError.t) result

  method close_sync :
    GCancellable.cancellable_t option -> (bool, GError.t) result

  method emit_signal :
    string option ->
    string ->
    string ->
    string ->
    Gvariant.t option ->
    (bool, GError.t) result

  method export_action_group :
    string -> GAction_group.action_group_t -> (int, GError.t) result

  method export_menu_model :
    string ->
    GMenu_link_iter_and__menu_model.menu_model_t ->
    (int, GError.t) result

  method flush_finish : GAsync_result.async_result_t -> (bool, GError.t) result

  method flush_sync :
    GCancellable.cancellable_t option -> (bool, GError.t) result

  method get_capabilities : unit -> Gio_enums.dbuscapabilityflags
  method get_exit_on_close : unit -> bool
  method get_flags : unit -> Gio_enums.dbusconnectionflags
  method get_guid : unit -> string
  method get_last_serial : unit -> UInt32.t
  method get_peer_credentials : unit -> GCredentials.credentials_t option
  method get_stream : unit -> GIo_stream.io_stream_t
  method get_unique_name : unit -> string option
  method is_closed : unit -> bool
  method remove_filter : int -> unit

  method send_message_with_reply_finish :
    GAsync_result.async_result_t ->
    (GD_bus_message.d_bus_message_t, GError.t) result

  method set_exit_on_close : bool -> unit
  method signal_unsubscribe : int -> unit
  method start_message_processing : unit -> unit
  method unexport_action_group : int -> unit
  method unexport_menu_model : int -> unit
  method unregister_object : int -> bool
  method unregister_subtree : int -> bool
  method closed : bool
  method as_d_bus_connection : D_bus_connection.t
end

class d_bus_connection : D_bus_connection.t -> d_bus_connection_t

val new_finish :
  GAsync_result.async_result_t -> (d_bus_connection_t, GError.t) result

val new_for_address_finish :
  GAsync_result.async_result_t -> (d_bus_connection_t, GError.t) result

val new_for_address_sync :
  string ->
  Gio_enums.dbusconnectionflags ->
  GD_bus_auth_observer.d_bus_auth_observer_t option ->
  GCancellable.cancellable_t option ->
  (d_bus_connection_t, GError.t) result

val new_sync :
  GIo_stream.io_stream_t ->
  string option ->
  Gio_enums.dbusconnectionflags ->
  GD_bus_auth_observer.d_bus_auth_observer_t option ->
  GCancellable.cancellable_t option ->
  (d_bus_connection_t, GError.t) result
