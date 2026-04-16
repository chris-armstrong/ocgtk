(* GENERATED CODE - DO NOT EDIT *)
(* DBusAnnotationInfo: DBusAnnotationInfo *)

type t = [ `d_bus_annotation_info ] Gobject.obj
(** Information about an annotation. *)

(* Methods *)

external unref : t -> unit = "ml_g_dbus_annotation_info_unref"
(** If @info is statically allocated, does nothing. Otherwise decreases
the reference count of @info. When its reference count drops to 0,
the memory used is freed. *)

external ref : t -> t = "ml_g_dbus_annotation_info_ref"
(** If @info is statically allocated does nothing. Otherwise increases
the reference count. *)
