(* GENERATED CODE - DO NOT EDIT *)
(* FocusEvent: FocusEvent *)

(** An event related to a keyboard focus change. *)

type t = [ `focus_event | `event ] Gobject.obj

(* Methods *)

external get_in : t -> bool = "ml_gdk_focus_event_get_in"
(** Extracts whether this event is about focus entering or leaving the surface.
*)
