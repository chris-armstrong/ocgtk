(* GENERATED CODE - DO NOT EDIT *)
(* EventControllerFocus: EventControllerFocus *)

(** Tracks keyboard focus.

    The event controller offers [Gtk.EventControllerFocus::enter] and
    [Gtk.EventControllerFocus::leave] signals, as well as
    [Gtk.EventControllerFocus:is-focus] and
    [Gtk.EventControllerFocus:contains-focus] properties which are updated to
    reflect focus changes inside the widget hierarchy that is rooted at the
    controllers widget. *)

type t = [ `event_controller_focus | `event_controller | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_event_controller_focus_new"
(** Create a new EventControllerFocus *)

(* Methods *)

external is_focus : t -> bool = "ml_gtk_event_controller_focus_is_focus"
(** Returns [TRUE] if focus is within [self], but not one of its children. *)

external contains_focus : t -> bool
  = "ml_gtk_event_controller_focus_contains_focus"
(** Returns [TRUE] if focus is within [self] or one of its children. *)

(* Properties *)

val on_enter :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_leave :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
