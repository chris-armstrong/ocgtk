(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventControllerScroll *)

type t = EventController.t

(** Create a new EventControllerScroll *)
external new_ : Gtk_enums.eventcontrollerscrollflags -> t = "ml_gtk_event_controller_scroll_new"

(* Properties *)

external set_flags : t -> Gtk_enums.eventcontrollerscrollflags -> unit = "ml_gtk_event_controller_scroll_set_flags"

external get_unit : t -> Gdk.scrollunit = "ml_gtk_event_controller_scroll_get_unit"

external get_flags : t -> Gtk_enums.eventcontrollerscrollflags = "ml_gtk_event_controller_scroll_get_flags"

