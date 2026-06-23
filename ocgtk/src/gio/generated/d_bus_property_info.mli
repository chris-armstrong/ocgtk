(* GENERATED CODE - DO NOT EDIT *)
(* DBusPropertyInfo: DBusPropertyInfo *)

type t = [ `d_bus_property_info ] Gobject.obj
(** Information about a D-Bus property on a D-Bus interface. *)

(* Methods *)

external ref : t -> t = "ml_g_dbus_property_info_ref"
(** If @info is statically allocated does nothing. Otherwise increases
the reference count. *)

(* Record field accessors *)

(* Getters *)
external get_ref_count : t -> int = "ml_g_d_bus_property_info_get_ref_count"
external get_name : t -> string = "ml_g_d_bus_property_info_get_name"
external get_signature : t -> string = "ml_g_d_bus_property_info_get_signature"

external get_flags : t -> Gio_enums.dbuspropertyinfoflags
  = "ml_g_d_bus_property_info_get_flags"

(* Setters *)
external set_ref_count : t -> int -> unit
  = "ml_g_d_bus_property_info_set_ref_count"

external set_name : t -> string -> unit = "ml_g_d_bus_property_info_set_name"

external set_signature : t -> string -> unit
  = "ml_g_d_bus_property_info_set_signature"

external set_flags : t -> Gio_enums.dbuspropertyinfoflags -> unit
  = "ml_g_d_bus_property_info_set_flags"

external make : int -> string -> string -> Gio_enums.dbuspropertyinfoflags -> t
  = "ml_g_d_bus_property_info_make"

external get_type : unit -> Gobject.Type.t
  = "ml_gio_d_bus_property_info_get_type"
