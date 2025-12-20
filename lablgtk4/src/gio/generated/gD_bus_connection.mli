class d_bus_connection : D_bus_connection.t ->
  object
    inherit Gd_bus_connection_signals.d_bus_connection_signals
    method close_sync : #GCancellable.cancellable option -> (bool, GError.t) result
    method export_menu_model : string -> #GMenu_link_iter_and__menu_model.menu_model -> (int, GError.t) result
    method flush_sync : #GCancellable.cancellable option -> (bool, GError.t) result
    method get_exit_on_close : unit -> bool
    method get_guid : unit -> string
    method get_peer_credentials : unit -> GCredentials.credentials option
    method get_stream : unit -> GIo_stream.io_stream
    method get_unique_name : unit -> string option
    method is_closed : unit -> bool
    method remove_filter : int -> unit
    method set_exit_on_close : bool -> unit
    method signal_unsubscribe : int -> unit
    method start_message_processing : unit -> unit
    method unexport_action_group : int -> unit
    method unexport_menu_model : int -> unit
    method unregister_object : int -> bool
    method unregister_subtree : int -> bool
    method address : string
    method authentication_observer : GD_bus_auth_observer.d_bus_auth_observer
    method closed : bool
    method as_d_bus_connection : D_bus_connection.t
  end

