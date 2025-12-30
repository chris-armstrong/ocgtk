(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventControllerScroll *)

type t = [`event_controller_scroll | `event_controller | `object_] Gobject.obj

val as_event_controller : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t

(** Create a new EventControllerScroll *)
external new_ : Gtk_enums.eventcontrollerscrollflags -> t = "ml_gtk_event_controller_scroll_new"

(* Methods *)
(** Sets the flags conditioning scroll controller behavior. *)
external set_flags : t -> Gtk_enums.eventcontrollerscrollflags -> unit = "ml_gtk_event_controller_scroll_set_flags"

(** Gets the flags conditioning the scroll controller behavior. *)
external get_flags : t -> Gtk_enums.eventcontrollerscrollflags = "ml_gtk_event_controller_scroll_get_flags"

(* Properties *)

