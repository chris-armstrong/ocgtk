(* GENERATED CODE - DO NOT EDIT *)
(* DBusAuthObserver: DBusAuthObserver *)

type t = [`d_bus_auth_observer | `object_] Gobject.obj

(** Create a new DBusAuthObserver *)
external new_ : unit -> t = "ml_g_dbus_auth_observer_new"

(* Methods *)
(** Emits the #GDBusAuthObserver::authorize-authenticated-peer signal on @observer. *)
external authorize_authenticated_peer : t -> Io_stream.t -> Credentials.t option -> bool = "ml_g_dbus_auth_observer_authorize_authenticated_peer"

(** Emits the #GDBusAuthObserver::allow-mechanism signal on @observer. *)
external allow_mechanism : t -> string -> bool = "ml_g_dbus_auth_observer_allow_mechanism"

