(* GENERATED CODE - DO NOT EDIT *)
(* DBusAuthObserver: DBusAuthObserver *)

type t = [ `d_bus_auth_observer | `object_ ] Gobject.obj
(** [GDBusAuthObserver] provides a mechanism for participating in how a
    [Gio.DBusServer] (or a [Gio.DBusConnection]) authenticates remote peers.

    Simply instantiate a [GDBusAuthObserver] and connect to the signals you are
    interested in. Note that new signals may be added in the future.

    {b Controlling Authentication Mechanisms}

    By default, a [GDBusServer] or server-side [GDBusConnection] will allow any
    authentication mechanism to be used. If you only want to allow D-Bus
    connections with the [EXTERNAL] mechanism, which makes use of credentials
    passing and is the recommended mechanism for modern Unix platforms such as
    Linux and the BSD family, you would use a signal handler like this:

    {[
    static gboolean
    on_allow_mechanism (GDBusAuthObserver *observer,
                        const gchar       *mechanism,
                        gpointer           user_data)
    {
      if (g_strcmp0 (mechanism, “EXTERNAL”) == 0)
        {
          return TRUE;
        }

      return FALSE;
    }
    ]}

    {b Controlling Authorization}

    By default, a [GDBusServer] or server-side [GDBusConnection] will accept
    connections from any successfully authenticated user (but not from anonymous
    connections using the [ANONYMOUS] mechanism). If you only want to allow
    D-Bus connections from processes owned by the same uid as the server, since
    GLib 2.68, you should use the
    [G_DBUS_SERVER_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER] flag. It’s equivalent
    to the following signal handler:

    {[
    static gboolean
    on_authorize_authenticated_peer (GDBusAuthObserver *observer,
                                     GIOStream         *stream,
                                     GCredentials      *credentials,
                                     gpointer           user_data)
    {
      gboolean authorized;

      authorized = FALSE;
      if (credentials != NULL)
        {
          GCredentials *own_credentials;
          own_credentials = g_credentials_new ();
          if (g_credentials_is_same_user (credentials, own_credentials, NULL))
            authorized = TRUE;
          g_object_unref (own_credentials);
        }

      return authorized;
    }
    ]} *)

external new_ : unit -> t = "ml_g_dbus_auth_observer_new"
(** Create a new DBusAuthObserver *)

(* Methods *)

external authorize_authenticated_peer :
  t -> Io_stream.t -> Credentials.t option -> bool
  = "ml_g_dbus_auth_observer_authorize_authenticated_peer"
(** Emits the [GDBusAuthObserver::authorize]-authenticated-peer signal on
    [observer]. *)

external allow_mechanism : t -> string -> bool
  = "ml_g_dbus_auth_observer_allow_mechanism"
(** Emits the [GDBusAuthObserver::allow]-mechanism signal on [observer]. *)

let on_allow_mechanism ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let mechanism =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_string v
        in
        let result = callback ~mechanism in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_boolean v x)
  in
  Gobject.Signal.connect obj ~name:"allow-mechanism" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_authorize_authenticated_peer ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let stream =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_object_exn v
        in
        let credentials =
          let v = Gobject.Closure.nth argv ~pos:2 in
          Gobject.Value.get_object v
        in
        let result = callback ~stream ~credentials in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_boolean v x)
  in
  Gobject.Signal.connect obj ~name:"authorize-authenticated-peer"
    ~callback:closure
    ~after:(Option.value after ~default:false)
