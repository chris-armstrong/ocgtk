class type d_bus_server_t = object
  inherit Initable.initable_t

  (** {2:signals Signals} *)

  method on_new_connection :
    ?after:bool ->
    callback:(connection:D_bus_connection.d_bus_connection_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a new authenticated connection has been made. Use
      g_dbus_connection_get_peer_credentials() to figure out what identity (if
      any), was authenticated.

      If you want to accept the connection, take a reference to the [connection]
      object and return [TRUE]. When you are done with the connection call
      g_dbus_connection_close() and give up your reference. Note that the other
      peer may disconnect at any time - a typical thing to do when accepting a
      connection is to listen to the [GDBusConnection::closed] signal.

      If [GDBusServer:flags] contains [G_DBUS_SERVER_FLAGS_RUN_IN_THREAD] then
      the signal is emitted in a new thread dedicated to the connection.
      Otherwise the signal is emitted in the thread-default main context (see
      [GLib.MainContext.push_thread_default]) of the thread that [server] was
      constructed in.

      You are guaranteed that signal handlers for this signal runs before
      incoming messages on [connection] are processed. This means that it's
      suitable to call g_dbus_connection_register_object() or similar from the
      signal handler. *)

  (** {2:methods Methods} *)

  method get_client_address : unit -> string
  (** Gets a
      {{:https://dbus.freedesktop.org/doc/dbus-specification.html#addresses}D-Bus
       address} string that can be used by clients to connect to [server].

      This is valid and non-empty if initializing the [GDBusServer] succeeded.
  *)

  method get_flags : unit -> Enums.dbusserverflags
  (** Gets the flags for [server]. *)

  method get_guid : unit -> string
  (** Gets the GUID for [server], as provided to g_dbus_server_new_sync(). *)

  method is_active : unit -> bool
  (** Gets whether [server] is active. *)

  method start : unit -> unit
  (** Starts [server]. *)

  method stop : unit -> unit
  (** Stops [server]. *)

  (** {2:properties Properties} *)

  method address : string
  (** The D-Bus address to listen on. *)

  method authentication_observer : D_bus_auth_observer.d_bus_auth_observer_t
  (** A [GDBusAuthObserver] object to assist in the authentication process or
      [NULL]. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_server : Raw.D_bus_server.t
end

(* High-level class for DBusServer *)
class d_bus_server (obj : Raw.D_bus_server.t) : d_bus_server_t =
  object (self)
    inherit Initable.initable (Raw.Initable.from_gobject obj)

    method on_new_connection ?(after = false) ~callback () =
      Raw.D_bus_server.on_new_connection ~after self#as_d_bus_server
        ~callback:(fun ~connection ->
          callback
            ~connection:(new D_bus_connection.d_bus_connection connection))

    method get_client_address : unit -> string =
      fun () -> Raw.D_bus_server.get_client_address obj

    method get_flags : unit -> Enums.dbusserverflags =
      fun () -> Raw.D_bus_server.get_flags obj

    method get_guid : unit -> string = fun () -> Raw.D_bus_server.get_guid obj
    method is_active : unit -> bool = fun () -> Raw.D_bus_server.is_active obj
    method start : unit -> unit = fun () -> Raw.D_bus_server.start obj
    method stop : unit -> unit = fun () -> Raw.D_bus_server.stop obj
    method address = Raw.D_bus_server.get_address obj

    method authentication_observer =
      new D_bus_auth_observer.d_bus_auth_observer
        (Raw.D_bus_server.get_authentication_observer obj)

    method as_d_bus_server = obj
  end

let new_sync (address : string) (flags : Enums.dbusserverflags) (guid : string)
    (observer : D_bus_auth_observer.d_bus_auth_observer_t option)
    (cancellable : Cancellable.cancellable_t option) :
    (d_bus_server_t, GError.t) result =
  let observer = Option.map (fun c -> c#as_d_bus_auth_observer) observer in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ =
    Raw.D_bus_server.new_sync address flags guid observer cancellable
  in
  Result.map (fun obj_ -> new d_bus_server obj_) obj_
