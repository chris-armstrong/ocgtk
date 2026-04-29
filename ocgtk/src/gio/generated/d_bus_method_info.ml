(* GENERATED CODE - DO NOT EDIT *)
(* DBusMethodInfo: DBusMethodInfo *)

type t = [ `d_bus_method_info ] Gobject.obj
(** Information about a method on an D-Bus interface. *)

(* Methods *)

external ref : t -> t = "ml_g_dbus_method_info_ref"
(** If @info is statically allocated does nothing. Otherwise increases
the reference count. *)
