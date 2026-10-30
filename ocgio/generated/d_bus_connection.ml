class type d_bus_connection_t = object
  inherit Async_initable.async_initable_t
  inherit Initable.initable_t

  (** {2:methods Methods} *)

  method call_finish :
    Async_result.async_result_t -> (Gvariant.t, GError.t) result
  (** Finishes an operation started with [g_dbus_connection_call ()]. *)

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
  [@@ocaml.doc
    "Synchronously invokes the [method_name] method on the\n\
     [interface_name] D-Bus interface on the remote object at\n\
     [object_path] owned by [bus_name].\n\n\
     If [connection] is closed then the operation will fail with\n\
     [G_IO_ERROR_CLOSED]. If [cancellable] is canceled, the\n\
     operation will fail with [G_IO_ERROR_CANCELLED]. If [parameters]\n\
     contains a value not compatible with the D-Bus protocol, the operation\n\
     fails with [G_IO_ERROR_INVALID_ARGUMENT].\n\n\
     If [reply_type] is non-[None] then the reply will be checked for having\n\
     this type and an error will be raised if it does not match.  Said\n\
     another way, if you give a [reply_type] then any non-[None] return\n\
     value will be of this type.\n\n\
     If the [parameters] [GVariant] is floating, it is consumed.\n\
     This allows convenient 'inline' use of [g_variant_new ()], e.g.:\n\n\
     {[\n\
    \ g_dbus_connection_call_sync (connection,\n\
    \                              \"org.freedesktop.StringThings\",\n\
    \                              \"/org/freedesktop/StringThings\",\n\
    \                              \"org.freedesktop.StringThings\",\n\
    \                              \"TwoStrings\",\n\
    \                              g_variant_new (\"(ss)\",\n\
    \                                             \"Thing One\",\n\
    \                                             \"Thing Two\"),\n\
    \                              NULL,\n\
    \                              G_DBUS_CALL_FLAGS_NONE,\n\
    \                              -1,\n\
    \                              NULL,\n\
    \                              &error);\n\
     ]}\n\n\
     The calling thread is blocked until a reply is received. See\n\
     [g_dbus_connection_call ()] for the asynchronous version of\n\
     this method."]

  method close_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an operation started with [g_dbus_connection_close ()]. *)

  method close_sync :
    Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Synchronously closes [connection]. The calling thread is blocked until
      this is done. See [g_dbus_connection_close ()] for the asynchronous
      version of this method and more details about what it does. *)

  method emit_signal :
    string option ->
    string ->
    string ->
    string ->
    Gvariant.t option ->
    (bool, GError.t) result
  (** Emits a signal.

      If the parameters GVariant is floating, it is consumed.

      This can only fail if [parameters] is not compatible with the D-Bus
      protocol ([G_IO_ERROR_INVALID_ARGUMENT]), or if [connection] has been
      closed ([G_IO_ERROR_CLOSED]). *)

  method export_action_group :
    string -> Action_group.action_group_t -> (int, GError.t) result
  (** Exports [action_group] on [connection] at [object_path].

      The implemented D-Bus API should be considered private. It is subject to
      change in the future.

      A given object path can only have one action group exported on it. If this
      constraint is violated, the export will fail and 0 will be returned (with
      [error] set accordingly).

      You can unexport the action group using
      [Gio.DBusConnection.unexport_action_group] with the return value of this
      function.

      The thread default main context is taken at the time of this call. All
      incoming action activations and state change requests are reported from
      this context. Any changes on the action group that cause it to emit
      signals must also come from this same context. Since incoming action
      activations and state change requests are rather likely to cause changes
      on the action group, this effectively limits a given action group to being
      exported from only one main context. *)

  method export_menu_model :
    string -> Menu_model.menu_model_t -> (int, GError.t) result
  (** Exports [menu] on [connection] at [object_path].

      The implemented D-Bus API should be considered private. It is subject to
      change in the future.

      An object path can only have one menu model exported on it. If this
      constraint is violated, the export will fail and 0 will be returned (with
      [error] set accordingly).

      Exporting menus with sections containing more than
      [G_MENU_EXPORTER_MAX_SECTION_SIZE] items is not supported and results in
      undefined behavior.

      You can unexport the menu model using
      [g_dbus_connection_unexport_menu_model ()] with the return value of this
      function. *)

  method flush_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an operation started with [g_dbus_connection_flush ()]. *)

  method flush_sync :
    Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Synchronously flushes [connection]. The calling thread is blocked until
      this is done. See [g_dbus_connection_flush ()] for the asynchronous
      version of this method and more details about what it does. *)

  method get_capabilities : unit -> Enums.dbuscapabilityflags
  (** Gets the capabilities negotiated with the remote peer *)

  method get_exit_on_close : unit -> bool
  (** Gets whether the process is terminated when [connection] is closed by the
      remote peer. See [GDBusConnection:exit-on-close] for more details. *)

  method get_flags : unit -> Enums.dbusconnectionflags
  (** Gets the flags used to construct this connection *)

  method get_guid : unit -> string
  (** The GUID of the peer performing the role of server when authenticating.
      See [GDBusConnection:guid] for more details. *)

  method get_last_serial : unit -> UInt32.t
  (** Retrieves the last serial number assigned to a [GDBusMessage] on the
      current thread. This includes messages sent via both low-level API such as
      [g_dbus_connection_send_message ()] as well as high-level API such as
      [g_dbus_connection_emit_signal ()], [g_dbus_connection_call ()] or
      [g_dbus_proxy_call ()]. *)

  method get_peer_credentials : unit -> Credentials.credentials_t option
  (** Gets the credentials of the authenticated peer. This will always return
      [None] unless [connection] acted as a server (e.g.
      [G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER] was passed) when set up
      and the client passed credentials as part of the authentication process.

      In a message bus setup, the message bus is always the server and each
      application is a client. So this method will always return [None] for
      message bus clients. *)

  method get_stream : unit -> Io_stream.io_stream_t
  (** Gets the underlying stream used for IO.

      While the [GDBusConnection] is active, it will interact with this stream
      from a worker thread, so it is not safe to interact with the stream
      directly. *)

  method get_unique_name : unit -> string option
  (** Gets the unique name of [connection] as assigned by the message bus. This
      can also be used to figure out if [connection] is a message bus
      connection. *)

  method is_closed : unit -> bool
  (** Gets whether [connection] is closed. *)

  method remove_filter : int -> unit
  (** Removes a filter.

      Note that since filters run in a different thread, there is a race
      condition where it is possible that the filter will be running even after
      calling [g_dbus_connection_remove_filter ()], so you cannot just free data
      that the filter might be using. Instead, you should pass a
      [GDestroyNotify] to [g_dbus_connection_add_filter ()], which will be
      called when it is guaranteed that the data is no longer needed. *)

  method send_message_with_reply_finish :
    Async_result.async_result_t ->
    (D_bus_message.d_bus_message_t, GError.t) result
  (** Finishes an operation started with
      [g_dbus_connection_send_message_with_reply ()].

      Note that [error] is only set if a local in-process error occurred. That
      is to say that the returned [GDBusMessage] object may be of type
      [G_DBUS_MESSAGE_TYPE_ERROR]. Use [g_dbus_message_to_gerror ()] to
      transcode this to a [GError].

      See this \[server\][Gio.DBusConnection] and \[client\][Gio.DBusConnection]
      for an example of how to use this low-level API to send and receive UNIX
      file descriptors. *)

  method set_exit_on_close : bool -> unit
  (** Sets whether the process should be terminated when [connection] is closed
      by the remote peer. See [GDBusConnection:exit-on-close] for more details.

      Note that this function should be used with care. Most modern UNIX
      desktops tie the notion of a user session with the session bus, and expect
      all of a user's applications to quit when their bus connection goes away.
      If you are setting [exit_on_close] to [false] for the shared session bus
      connection, you should make sure that your application exits when the user
      session ends. *)

  method signal_unsubscribe : int -> unit
  (** Unsubscribes from signals.

      Note that there may still be D-Bus traffic to process (relating to this
      signal subscription) in the current thread-default [GMainContext] after
      this function has returned. You should continue to iterate the
      [GMainContext] until the [GDestroyNotify] function passed to
      [g_dbus_connection_signal_subscribe ()] is called, in order to avoid
      memory leaks through callbacks queued on the [GMainContext] after it’s
      stopped being iterated. Alternatively, any idle source with a priority
      lower than [G_PRIORITY_DEFAULT] that was scheduled after unsubscription,
      also indicates that all resources of this subscription are released. *)

  method start_message_processing : unit -> unit
  (** If [connection] was created with
      [G_DBUS_CONNECTION_FLAGS_DELAY_MESSAGE_PROCESSING], this method starts
      processing messages. Does nothing on if [connection] wasn't created with
      this flag or if the method has already been called. *)

  method unexport_action_group : int -> unit
  (** Reverses the effect of a previous call to
      [Gio.DBusConnection.export_action_group].

      It is an error to call this function with an ID that wasn’t returned from
      [Gio.DBusConnection.export_action_group] or to call it with the same ID
      more than once. *)

  method unexport_menu_model : int -> unit
  (** Reverses the effect of a previous call to
      [g_dbus_connection_export_menu_model ()].

      It is an error to call this function with an ID that wasn't returned from
      [g_dbus_connection_export_menu_model ()] or to call it with the same ID
      more than once. *)

  method unregister_object : int -> bool
  (** Unregisters an object. *)

  method unregister_subtree : int -> bool
  (** Unregisters a subtree. *)

  (** {2:conversions Conversions} *)

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
        string -> Menu_model.menu_model_t -> (int, GError.t) result =
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
