(* GENERATED CODE - DO NOT EDIT *)
(* EventControllerFocus: EventControllerFocus *)

(** Tracks keyboard focus.

    The event controller offers [Gtk.EventControllerFocus::enter] and
    [Gtk.EventControllerFocus::leave] signals, as well as
    [Gtk.EventControllerFocus:is-focus] and
    [Gtk.EventControllerFocus:contains-focus] properties which are updated to
    reflect focus changes inside the widget hierarchy that is rooted at the
    controllers widget.

    The class built on this module is in {!Ocgtk.Event_controller_focus}. *)

type t = [ `event_controller_focus | `event_controller | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gtk_event_controller_focus_get_type"

external new_ : unit -> t = "ml_gtk_event_controller_focus_new"
(** Creates a new event controller that will handle focus events. *)

(* Methods *)

external is_focus : t -> bool = "ml_gtk_event_controller_focus_is_focus"
(** Returns [TRUE] if focus is within [self], but not one of its children. *)

external contains_focus : t -> bool
  = "ml_gtk_event_controller_focus_contains_focus"
(** Returns [TRUE] if focus is within [self] or one of its children. *)

(* Properties *)

val on_enter :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted whenever the focus enters into the widget or one of its descendents.

    Note that this means you may not get an ::enter signal even though the
    widget becomes the focus location, in certain cases (such as when the focus
    moves from a descendent of the widget to the widget itself). If you are
    interested in these cases, you can monitor the
    [Gtk.EventControllerFocus:is-focus] property for changes. *)

val on_leave :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted whenever the focus leaves the widget hierarchy that is rooted at the
    widget that the controller is attached to.

    Note that this means you may not get a ::leave signal even though the focus
    moves away from the widget, in certain cases (such as when the focus moves
    from the widget to a descendent). If you are interested in these cases, you
    can monitor the [Gtk.EventControllerFocus:is-focus] property for changes. *)
