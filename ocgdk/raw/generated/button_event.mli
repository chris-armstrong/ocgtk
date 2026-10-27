(* GENERATED CODE - DO NOT EDIT *)
(* ButtonEvent: ButtonEvent *)

(** An event related to a button on a pointer device.

    The class built on this module is in {!Ocgdk.Button_event}. *)

type t = [ `button_event | `event ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gdk_button_event_get_type"

(* Methods *)

external get_button : t -> int = "ml_gdk_button_event_get_button"
(** Extract the button number from a button event. *)
