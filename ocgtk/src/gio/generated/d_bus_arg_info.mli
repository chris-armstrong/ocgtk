(* GENERATED CODE - DO NOT EDIT *)
(* DBusArgInfo: DBusArgInfo *)

type t = [ `d_bus_arg_info ] Gobject.obj
(** Information about an argument for a method or a signal. *)

(* Methods *)

external ref : t -> t = "ml_g_dbus_arg_info_ref"
(** If @info is statically allocated does nothing. Otherwise increases
the reference count. *)

(* Record field accessors *)

(* Getters *)
external get_ref_count : t -> int = "ml_g_d_bus_arg_info_get_ref_count"
external get_name : t -> string = "ml_g_d_bus_arg_info_get_name"
external get_signature : t -> string = "ml_g_d_bus_arg_info_get_signature"

(* Setters *)
external set_ref_count : t -> int -> unit = "ml_g_d_bus_arg_info_set_ref_count"
external set_name : t -> string -> unit = "ml_g_d_bus_arg_info_set_name"

external set_signature : t -> string -> unit
  = "ml_g_d_bus_arg_info_set_signature"

external make : int -> string -> string -> t = "ml_g_d_bus_arg_info_make"
external get_type : unit -> Gobject.Type.t = "ml_gio_d_bus_arg_info_get_type"
