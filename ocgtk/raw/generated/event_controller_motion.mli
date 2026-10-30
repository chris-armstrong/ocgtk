(* GENERATED CODE - DO NOT EDIT *)
(* EventControllerMotion: EventControllerMotion *)

(** Tracks the pointer position.

    The event controller offers
    {{!Ocgtk.Raw.Event_controller_motion.val-on_enter}[Gtk.EventControllerMotion::enter]}
    and
    {{!Ocgtk.Raw.Event_controller_motion.val-on_leave}[Gtk.EventControllerMotion::leave]}
    signals, as well as
    {{!Ocgtk.Raw.Event_controller_motion.val-is_pointer}[Gtk.EventControllerMotion:is-pointer]}
    and
    {{!Ocgtk.Raw.Event_controller_motion.val-contains_pointer}[Gtk.EventControllerMotion:contains-pointer]}
    properties which are updated to reflect changes in the pointer position as
    it moves over the widget.

    The class built on this module is in {!Ocgtk.Event_controller_motion}. *)

type t = [ `event_controller_motion | `event_controller | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gtk_event_controller_motion_get_type"

external new_ : unit -> t = "ml_gtk_event_controller_motion_new"
(** Creates a new event controller that will handle motion events. *)

(* Methods *)

external is_pointer : t -> bool = "ml_gtk_event_controller_motion_is_pointer"
(** Returns if a pointer is within [self], but not one of its children. *)

external contains_pointer : t -> bool
  = "ml_gtk_event_controller_motion_contains_pointer"
(** Returns if a pointer is within [self] or one of its children. *)

(* Properties *)

val on_enter :
  ?after:bool ->
  t ->
  callback:(x:float -> y:float -> unit) ->
  Gobject.Signal.handler_id
(** Signals that the pointer has entered the widget. *)

val on_leave :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Signals that the pointer has left the widget. *)

val on_motion :
  ?after:bool ->
  t ->
  callback:(x:float -> y:float -> unit) ->
  Gobject.Signal.handler_id
(** Emitted when the pointer moves inside the widget. *)
