(* GENERATED CODE - DO NOT EDIT *)
(* TimeCoord: TimeCoord *)

type t = [ `time_coord ] Gobject.obj
(** A `GdkTimeCoord` stores a single event in a motion history.

To check whether an axis is present, check whether the corresponding
flag from the [flags@Gdk.AxisFlags] enumeration is set in the @flags
To access individual axis values, use the values of the values of
the [enum@Gdk.AxisUse] enumerations as indices. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_time : t -> UInt32.t = "ml_gdk_time_coord_get_time"
external get_flags : t -> Gdk_enums.axisflags = "ml_gdk_time_coord_get_flags"
external get_axes : t -> float array = "ml_gdk_time_coord_get_axes"

(* Setters *)
external set_time : t -> UInt32.t -> unit = "ml_gdk_time_coord_set_time"

external set_flags : t -> Gdk_enums.axisflags -> unit
  = "ml_gdk_time_coord_set_flags"

external set_axes : t -> float array -> unit = "ml_gdk_time_coord_set_axes"

external make : UInt32.t -> Gdk_enums.axisflags -> float array -> t
  = "ml_gdk_time_coord_make"
