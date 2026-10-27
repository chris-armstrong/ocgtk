(** Tracks the pointer position.

    The event controller offers [Gtk.EventControllerMotion::enter] and
    [Gtk.EventControllerMotion::leave] signals, as well as
    [Gtk.EventControllerMotion:is-pointer] and
    [Gtk.EventControllerMotion:contains-pointer] properties which are updated to
    reflect changes in the pointer position as it moves over the widget.

    Its methods, signals and properties are on
    {!class-type-event_controller_motion_t}. The functions it is built on are in
    {!Ocgtk.Raw.Event_controller_motion}. *)

(** The methods, signals and properties of a [GtkEventControllerMotion]. *)
class type event_controller_motion_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_enter :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_leave :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_motion :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method contains_pointer : unit -> bool
  method is_pointer : unit -> bool
  method as_event_controller_motion : Raw.Event_controller_motion.t
end

class event_controller_motion :
  Raw.Event_controller_motion.t ->
  event_controller_motion_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Event_controller_motion.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkEventControllerMotion], give one already wrapped.
*)

val new_ : unit -> event_controller_motion_t
