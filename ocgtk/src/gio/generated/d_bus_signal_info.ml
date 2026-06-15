(* GENERATED CODE - DO NOT EDIT *)
(* DBusSignalInfo: DBusSignalInfo *)

type t = [ `d_bus_signal_info ] Gobject.obj
(** Information about a signal on a D-Bus interface. *)

(* Methods *)

external ref : t -> t = "ml_g_dbus_signal_info_ref"
(** If @info is statically allocated does nothing. Otherwise increases
the reference count. *)

(* Record field accessors *)

(* Getters *)
external get_ref_count : t -> int = "ml_g_d_bus_signal_info_get_ref_count"
external get_name : t -> string = "ml_g_d_bus_signal_info_get_name"

(* Setters *)
external set_ref_count : t -> int -> unit
  = "ml_g_d_bus_signal_info_set_ref_count"

external set_name : t -> string -> unit = "ml_g_d_bus_signal_info_set_name"
external make : int -> string -> t = "ml_g_d_bus_signal_info_make"
