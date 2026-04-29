(* GENERATED CODE - DO NOT EDIT *)
(* DBusArgInfo: DBusArgInfo *)

type t = [ `d_bus_arg_info ] Gobject.obj
(** Information about an argument for a method or a signal. *)

(* Methods *)

external ref : t -> t = "ml_g_dbus_arg_info_ref"
(** If @info is statically allocated does nothing. Otherwise increases
the reference count. *)
