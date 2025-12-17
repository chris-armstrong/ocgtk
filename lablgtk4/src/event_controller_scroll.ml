(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventControllerScroll *)

type t = [`event_controller_scroll | `event_controller | `object_] Gobject.obj

let as_event_controller (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t = Obj.magic obj

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

