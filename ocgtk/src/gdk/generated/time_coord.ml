(* GENERATED CODE - DO NOT EDIT *)
(* TimeCoord: TimeCoord *)

(** A `GdkTimeCoord` stores a single event in a motion history.

To check whether an axis is present, check whether the corresponding
flag from the [flags@Gdk.AxisFlags] enumeration is set in the @flags
To access individual axis values, use the values of the values of
the [enum@Gdk.AxisUse] enumerations as indices. *)
type t = [`time_coord] Gobject.obj

(* Methods *)
