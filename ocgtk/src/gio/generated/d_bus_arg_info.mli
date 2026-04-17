(* GENERATED CODE - DO NOT EDIT *)
(* DBusArgInfo: DBusArgInfo *)

type t = [ `d_bus_arg_info ] Gobject.obj
(** Information about an argument for a method or a signal. *)

(* Methods *)

external unref : t -> unit = "ml_g_dbus_arg_info_unref"
(** If @info is statically allocated, does nothing. Otherwise decreases
the reference count of @info. When its reference count drops to 0,
the memory used is freed. *)

external ref : t -> t = "ml_g_dbus_arg_info_ref"
(** If @info is statically allocated does nothing. Otherwise increases
the reference count. *)
