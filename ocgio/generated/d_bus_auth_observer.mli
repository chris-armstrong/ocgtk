(** [GDBusAuthObserver] provides a mechanism for participating in how a
    {{!Ocgio.D_bus_server.class-type-d_bus_server_t}[Gio.DBusServer]} (or a
    {{!Ocgio.D_bus_connection.class-type-d_bus_connection_t}[Gio.DBusConnection]})
    authenticates remote peers.

    Its methods, signals and properties are on
    {!class-type-d_bus_auth_observer_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgio.Raw.D_bus_auth_observer}. *)

(** {1:class Class} *)

class type d_bus_auth_observer_t = object
  (** {2:signals Signals} *)

  method on_allow_mechanism :
    ?after:bool ->
    callback:(mechanism:string -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted to check if [mechanism] is allowed to be used. *)

  method on_authorize_authenticated_peer :
    ?after:bool ->
    callback:
      (stream:Io_stream.io_stream_t ->
      credentials:Credentials.credentials_t option ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted to check if a peer that is successfully authenticated is
      authorized. *)

  (** {2:methods Methods} *)

  method allow_mechanism : string -> bool
  (** Emits the [GDBusAuthObserver::allow-mechanism] signal on [observer]. *)

  method authorize_authenticated_peer :
    Io_stream.io_stream_t -> Credentials.credentials_t option -> bool
  (** Emits the [GDBusAuthObserver::authorize-authenticated-peer] signal on
      [observer]. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_auth_observer : Raw.D_bus_auth_observer.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [DBusAuthObserver].}\n\n\
     [GDBusAuthObserver] provides a mechanism for participating\n\
     in how a \
     {{!Ocgio.D_bus_server.class-type-d_bus_server_t}[Gio.DBusServer]} (or a \
     {{!Ocgio.D_bus_connection.class-type-d_bus_connection_t}[Gio.DBusConnection]})\n\
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
     [G_DBUS_SERVER_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER] flag. It’s \
     equivalent\n\
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

class d_bus_auth_observer : Raw.D_bus_auth_observer.t -> d_bus_auth_observer_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_auth_observer.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 [GDBusAuthObserver] provides a mechanism for participating\n\
 in how a {{!Ocgio.D_bus_server.class-type-d_bus_server_t}[Gio.DBusServer]} \
 (or a \
 {{!Ocgio.D_bus_connection.class-type-d_bus_connection_t}[Gio.DBusConnection]})\n\
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

(** {1:constructors Constructors} *)

val new_ : unit -> d_bus_auth_observer_t
(** Creates a new
    {{!Ocgio.D_bus_auth_observer.class-type-d_bus_auth_observer_t}[GDBusAuthObserver]}
    object. *)
