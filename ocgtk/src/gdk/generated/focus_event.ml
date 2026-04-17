(* GENERATED CODE - DO NOT EDIT *)
(* FocusEvent: FocusEvent *)

type t = [`focus_event | `event] Gobject.obj

(* Methods *)
(** Extracts whether this event is about focus entering or
leaving the surface. *)
external get_in : t -> bool = "ml_gdk_focus_event_get_in"

