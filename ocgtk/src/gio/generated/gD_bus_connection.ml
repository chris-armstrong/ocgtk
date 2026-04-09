(* Signal class defined in gd_bus_connection_signals.ml *)

class type d_bus_connection_t = object
    inherit GAsync_initable.async_initable_t
    inherit GInitable.initable_t
    inherit Gd_bus_connection_signals.d_bus_connection_signals
    method close_sync : GCancellable.cancellable_t option -> (bool, GError.t) result
    method export_menu_model : string -> GMenu_link_iter_and__menu_model.menu_model_t -> (int, GError.t) result
    method flush_sync : GCancellable.cancellable_t option -> (bool, GError.t) result
    method get_capabilities : unit -> Gio_enums.dbuscapabilityflags
    method get_exit_on_close : unit -> bool
    method get_flags : unit -> Gio_enums.dbusconnectionflags
    method get_guid : unit -> string
    method get_peer_credentials : unit -> GCredentials.credentials_t option
    method get_stream : unit -> GIo_stream.io_stream_t
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
    method authentication_observer : GD_bus_auth_observer.d_bus_auth_observer_t
    method closed : bool
    method as_d_bus_connection : D_bus_connection.t
end

(* High-level class for DBusConnection *)
class d_bus_connection (obj : D_bus_connection.t) : d_bus_connection_t = object (self)
  inherit GAsync_initable.async_initable (Async_initable.from_gobject obj)
  inherit GInitable.initable (Initable.from_gobject obj)
  inherit Gd_bus_connection_signals.d_bus_connection_signals obj

  method close_sync : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (D_bus_connection.close_sync obj cancellable)

  method export_menu_model : string -> GMenu_link_iter_and__menu_model.menu_model_t -> (int, GError.t) result =
    fun object_path menu ->
      let menu = menu#as_menu_model in
      (D_bus_connection.export_menu_model obj object_path menu)

  method flush_sync : GCancellable.cancellable_t option -> (bool, GError.t) result =
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

  method get_peer_credentials : unit -> GCredentials.credentials_t option =
    fun () ->
      Option.map (fun ret -> new GCredentials.credentials ret) (D_bus_connection.get_peer_credentials obj)

  method get_stream : unit -> GIo_stream.io_stream_t =
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

let new_finish (res : GAsync_result.async_result_t) : (d_bus_connection_t, GError.t) result =
  let res = res#as_async_result in
  let obj_ = D_bus_connection.new_finish res in
Result.map (fun obj_ ->  new d_bus_connection obj_) obj_

let new_for_address_finish (res : GAsync_result.async_result_t) : (d_bus_connection_t, GError.t) result =
  let res = res#as_async_result in
  let obj_ = D_bus_connection.new_for_address_finish res in
Result.map (fun obj_ ->  new d_bus_connection obj_) obj_

let new_for_address_sync (address : string) (flags : Gio_enums.dbusconnectionflags) (observer : GD_bus_auth_observer.d_bus_auth_observer_t option) (cancellable : GCancellable.cancellable_t option) : (d_bus_connection_t, GError.t) result =
  let observer = Option.map (fun c -> c#as_d_bus_auth_observer) observer in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ = D_bus_connection.new_for_address_sync address flags observer cancellable in
Result.map (fun obj_ ->  new d_bus_connection obj_) obj_

let new_sync (stream : GIo_stream.io_stream_t) (guid : string option) (flags : Gio_enums.dbusconnectionflags) (observer : GD_bus_auth_observer.d_bus_auth_observer_t option) (cancellable : GCancellable.cancellable_t option) : (d_bus_connection_t, GError.t) result =
  let stream = stream#as_io_stream in
  let observer = Option.map (fun c -> c#as_d_bus_auth_observer) observer in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ = D_bus_connection.new_sync stream guid flags observer cancellable in
Result.map (fun obj_ ->  new d_bus_connection obj_) obj_

