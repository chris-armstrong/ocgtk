(** Tracks keyboard focus.

    The event controller offers [Gtk.EventControllerFocus::enter] and
    [Gtk.EventControllerFocus::leave] signals, as well as
    [Gtk.EventControllerFocus:is-focus] and
    [Gtk.EventControllerFocus:contains-focus] properties which are updated to
    reflect focus changes inside the widget hierarchy that is rooted at the
    controllers widget.

    Its methods, signals and properties are on
    {!class-type-event_controller_focus_t}. The functions it is built on are in
    {!Ocgtk.Raw.Event_controller_focus}. *)

(** The methods, signals and properties of a [GtkEventControllerFocus]. *)
class type event_controller_focus_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_enter :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_leave :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method contains_focus : unit -> bool
  method is_focus : unit -> bool
  method as_event_controller_focus : Raw.Event_controller_focus.t
end

class event_controller_focus :
  Raw.Event_controller_focus.t ->
  event_controller_focus_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Event_controller_focus.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkEventControllerFocus], give one already wrapped.
*)

val new_ : unit -> event_controller_focus_t
