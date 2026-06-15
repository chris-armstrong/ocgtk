(* GENERATED CODE - DO NOT EDIT *)
(* DBusAnnotationInfo: DBusAnnotationInfo *)

type t = [ `d_bus_annotation_info ] Gobject.obj
(** Information about an annotation. *)

(* Methods *)

external ref : t -> t = "ml_g_dbus_annotation_info_ref"
(** If @info is statically allocated does nothing. Otherwise increases
the reference count. *)

(* Record field accessors *)

(* Getters *)
external get_ref_count : t -> int = "ml_g_d_bus_annotation_info_get_ref_count"
external get_key : t -> string = "ml_g_d_bus_annotation_info_get_key"
external get_value : t -> string = "ml_g_d_bus_annotation_info_get_value"

(* Setters *)
external set_ref_count : t -> int -> unit
  = "ml_g_d_bus_annotation_info_set_ref_count"

external set_key : t -> string -> unit = "ml_g_d_bus_annotation_info_set_key"

external set_value : t -> string -> unit
  = "ml_g_d_bus_annotation_info_set_value"

external make : int -> string -> string -> t = "ml_g_d_bus_annotation_info_make"
