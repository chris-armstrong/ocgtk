(* GENERATED CODE - DO NOT EDIT *)
(* DNDEvent: DNDEvent *)

type t = [ `dnd_event | `event ] Gobject.obj

(* Methods *)

external get_drop : t -> Drop.t option = "ml_gdk_dnd_event_get_drop"
(** Gets the `GdkDrop` object from a DND event. *)
