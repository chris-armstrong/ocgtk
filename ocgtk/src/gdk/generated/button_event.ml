(* GENERATED CODE - DO NOT EDIT *)
(* ButtonEvent: ButtonEvent *)

type t = [ `button_event | `event ] Gobject.obj

(* Methods *)

external get_button : t -> int = "ml_gdk_button_event_get_button"
(** Extract the button number from a button event. *)
