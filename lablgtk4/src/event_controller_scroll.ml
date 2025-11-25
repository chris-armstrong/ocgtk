(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventControllerScroll *)

type t = EventController.t

(** Create a new EventControllerScroll *)
external new_ : Gtk_enums.eventcontrollerscrollflags -> t = "ml_gtk_event_controller_scroll_new"

(* Properties *)

(** Sets the flags conditioning scroll controller behavior. *)
external set_flags : t -> Gtk_enums.eventcontrollerscrollflags -> unit = "ml_gtk_event_controller_scroll_set_flags"

(** Gets the scroll unit of the last
[signal@Gtk.EventControllerScroll::scroll] signal received.

Always returns %GDK_SCROLL_UNIT_WHEEL if the
%GTK_EVENT_CONTROLLER_SCROLL_DISCRETE flag is set. *)
external get_unit : t -> Gdk.scrollunit = "ml_gtk_event_controller_scroll_get_unit"

(** Gets the flags conditioning the scroll controller behavior. *)
external get_flags : t -> Gtk_enums.eventcontrollerscrollflags = "ml_gtk_event_controller_scroll_get_flags"

