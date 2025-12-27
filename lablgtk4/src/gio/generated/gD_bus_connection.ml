(* Signal class defined in gd_bus_connection_signals.ml *)

(* High-level class for DBusConnection *)
class d_bus_connection (obj : D_bus_connection.t) = object (self)
  inherit Gd_bus_connection_signals.d_bus_connection_signals obj

  method close_sync : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (D_bus_connection.close_sync obj cancellable)

  method export_menu_model : 'p1. string -> (#GMenu_link_iter_and__menu_model.menu_model as 'p1) -> (int, GError.t) result =
    fun object_path menu ->
      let menu = menu#as_menu_model in
      (D_bus_connection.export_menu_model obj object_path menu)

  method flush_sync : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (D_bus_connection.flush_sync obj cancellable)

  method get_capabilities : unit -> Gio_enums.dbuscapabilityflags =
    fun () ->
      (D_bus_connection.get_capabilities obj)

  method get_exit_on_close : unit -> bool =
    fun () ->
      (D_bus_connection.get_exit_on_close obj)

  method get_flags : unit -> Gio_enums.dbusconnectionflags =
    fun () ->
      (D_bus_connection.get_flags obj)

  method get_guid : unit -> string =
    fun () ->
      (D_bus_connection.get_guid obj)

  method get_peer_credentials : unit -> GCredentials.credentials option =
    fun () ->
      Option.map (fun ret -> new GCredentials.credentials ret) (D_bus_connection.get_peer_credentials obj)

  method get_stream : unit -> GIo_stream.io_stream =
    fun () ->
      new  GIo_stream.io_stream(D_bus_connection.get_stream obj)

  method get_unique_name : unit -> string option =
    fun () ->
      (D_bus_connection.get_unique_name obj)

  method is_closed : unit -> bool =
    fun () ->
      (D_bus_connection.is_closed obj)

  method remove_filter : int -> unit =
    fun filter_id ->
      (D_bus_connection.remove_filter obj filter_id)

  method set_exit_on_close : bool -> unit =
    fun exit_on_close ->
      (D_bus_connection.set_exit_on_close obj exit_on_close)

  method signal_unsubscribe : int -> unit =
    fun subscription_id ->
      (D_bus_connection.signal_unsubscribe obj subscription_id)

  method start_message_processing : unit -> unit =
    fun () ->
      (D_bus_connection.start_message_processing obj)

  method unexport_action_group : int -> unit =
    fun export_id ->
      (D_bus_connection.unexport_action_group obj export_id)

  method unexport_menu_model : int -> unit =
    fun export_id ->
      (D_bus_connection.unexport_menu_model obj export_id)

  method unregister_object : int -> bool =
    fun registration_id ->
      (D_bus_connection.unregister_object obj registration_id)

  method unregister_subtree : int -> bool =
    fun registration_id ->
      (D_bus_connection.unregister_subtree obj registration_id)

  method address = D_bus_connection.get_address obj

  method authentication_observer = new GD_bus_auth_observer.d_bus_auth_observer (D_bus_connection.get_authentication_observer obj)

  method closed = D_bus_connection.get_closed obj

    method as_d_bus_connection = obj
end

