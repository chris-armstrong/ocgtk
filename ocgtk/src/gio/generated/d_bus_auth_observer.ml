(* GENERATED CODE - DO NOT EDIT *)
(* DBusAuthObserver: DBusAuthObserver *)

[@@@ocaml.text
"[GDBusAuthObserver] provides a mechanism for participating\n\
 in how a [Gio.DBusServer] (or a [Gio.DBusConnection])\n\
 authenticates remote peers.\n\n\
 Simply instantiate a [GDBusAuthObserver] and connect to the\n\
 signals you are interested in. Note that new signals may be added\n\
 in the future.\n\n\
 {b Controlling Authentication Mechanisms}\n\n\
 By default, a [GDBusServer] or server-side [GDBusConnection] will allow\n\
 any authentication mechanism to be used. If you only want to allow D-Bus\n\
 connections with the [EXTERNAL] mechanism, which makes use of credentials\n\
 passing and is the recommended mechanism for modern Unix platforms such\n\
 as Linux and the BSD family, you would use a signal handler like this:\n\n\
 {[\n\
 static gboolean\n\
 on_allow_mechanism (GDBusAuthObserver *observer,\n\
\                    const gchar       *mechanism,\n\
\                    gpointer           user_data)\n\
 {\n\
\  if (g_strcmp0 (mechanism, \"EXTERNAL\") == 0)\n\
\    {\n\
\      return TRUE;\n\
\    }\n\n\
\  return FALSE;\n\
 }\n\
 ]}\n\n\
 {b Controlling Authorization}\n\n\
 By default, a [GDBusServer] or server-side [GDBusConnection] will accept\n\
 connections from any successfully authenticated user (but not from\n\
 anonymous connections using the [ANONYMOUS] mechanism). If you only\n\
 want to allow D-Bus connections from processes owned by the same uid\n\
 as the server, since GLib 2.68, you should use the\n\
 [G_DBUS_SERVER_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER] flag. It’s equivalent\n\
 to the following signal handler:\n\n\
 {[\n\
 static gboolean\n\
 on_authorize_authenticated_peer (GDBusAuthObserver *observer,\n\
\                                 GIOStream         *stream,\n\
\                                 GCredentials      *credentials,\n\
\                                 gpointer           user_data)\n\
 {\n\
\  gboolean authorized;\n\n\
\  authorized = FALSE;\n\
\  if (credentials != NULL)\n\
\    {\n\
\      GCredentials *own_credentials;\n\
\      own_credentials = g_credentials_new ();\n\
\      if (g_credentials_is_same_user (credentials, own_credentials, NULL))\n\
\        authorized = TRUE;\n\
\      g_object_unref (own_credentials);\n\
\    }\n\n\
\  return authorized;\n\
 }\n\
 ]}"]

type t = [ `d_bus_auth_observer | `object_ ] Gobject.obj

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
