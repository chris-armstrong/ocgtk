(* GENERATED CODE - DO NOT EDIT *)
(* DBusSignalInfo: DBusSignalInfo *)

(** Information about a signal on a D-Bus interface. *)
type t = [`d_bus_signal_info] Gobject.obj

(* Methods *)
(** If @info is statically allocated, does nothing. Otherwise decreases
the reference count of @info. When its reference count drops to 0,
the memory used is freed. *)
external unref : t -> unit = "ml_g_dbus_signal_info_unref"

(** If @info is statically allocated does nothing. Otherwise increases
the reference count. *)
external ref : t -> t = "ml_g_dbus_signal_info_ref"

