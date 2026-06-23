(* GENERATED CODE - DO NOT EDIT *)
(* DBusErrorEntry: DBusErrorEntry *)

type t = [ `d_bus_error_entry ] Gobject.obj
(** Struct used in g_dbus_error_register_error_domain(). *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_error_code : t -> int = "ml_g_d_bus_error_entry_get_error_code"

external get_dbus_error_name : t -> string
  = "ml_g_d_bus_error_entry_get_dbus_error_name"

(* Setters *)
external set_error_code : t -> int -> unit
  = "ml_g_d_bus_error_entry_set_error_code"

external set_dbus_error_name : t -> string -> unit
  = "ml_g_d_bus_error_entry_set_dbus_error_name"

external make : int -> string -> t = "ml_g_d_bus_error_entry_make"
