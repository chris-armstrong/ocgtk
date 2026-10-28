(** Tracks the pointer position.

    Its methods, signals and properties are on
    {!class-type-event_controller_motion_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Event_controller_motion}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [EventControllerMotion].}

    Tracks the pointer position.

    The event controller offers [Gtk.EventControllerMotion::enter] and
    [Gtk.EventControllerMotion::leave] signals, as well as
    [Gtk.EventControllerMotion:is-pointer] and
    [Gtk.EventControllerMotion:contains-pointer] properties which are updated to
    reflect changes in the pointer position as it moves over the widget. *)
class type event_controller_motion_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_enter :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Signals that the pointer has entered the widget. *)

  method on_leave :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Signals that the pointer has left the widget. *)

  method on_motion :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the pointer moves inside the widget. *)

  method contains_pointer : unit -> bool
  (** Returns if a pointer is within [self] or one of its children. *)

  method is_pointer : unit -> bool
  (** Returns if a pointer is within [self], but not one of its children. *)

  method as_event_controller_motion : Raw.Event_controller_motion.t
end

class event_controller_motion :
  Raw.Event_controller_motion.t ->
  event_controller_motion_t
(** Wraps a raw handle of {!Ocgtk.Raw.Event_controller_motion.t}. *)

(** {1:description Description}

    Tracks the pointer position.

    The event controller offers [Gtk.EventControllerMotion::enter] and
    [Gtk.EventControllerMotion::leave] signals, as well as
    [Gtk.EventControllerMotion:is-pointer] and
    [Gtk.EventControllerMotion:contains-pointer] properties which are updated to
    reflect changes in the pointer position as it moves over the widget. *)

(** {1:constructors Constructors} *)

val new_ : unit -> event_controller_motion_t
(** Creates a new event controller that will handle motion events. *)
