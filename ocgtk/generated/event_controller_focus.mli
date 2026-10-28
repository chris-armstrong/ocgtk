(** Tracks keyboard focus.

    Its methods, signals and properties are on
    {!class-type-event_controller_focus_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Event_controller_focus}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [EventControllerFocus].}

    Inherits from:
    {{!Ocgtk.Event_controller.class-type-event_controller_t}Ocgtk.Event_controller}

    Tracks keyboard focus.

    The event controller offers [Gtk.EventControllerFocus::enter] and
    [Gtk.EventControllerFocus::leave] signals, as well as
    [Gtk.EventControllerFocus:is-focus] and
    [Gtk.EventControllerFocus:contains-focus] properties which are updated to
    reflect focus changes inside the widget hierarchy that is rooted at the
    controllers widget. *)
class type event_controller_focus_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  (** {2:signals Signals} *)

  method on_enter :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted whenever the focus enters into the widget or one of its
      descendents.

      Note that this means you may not get an ::enter signal even though the
      widget becomes the focus location, in certain cases (such as when the
      focus moves from a descendent of the widget to the widget itself). If you
      are interested in these cases, you can monitor the
      [Gtk.EventControllerFocus:is-focus] property for changes. *)

  method on_leave :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted whenever the focus leaves the widget hierarchy that is rooted at
      the widget that the controller is attached to.

      Note that this means you may not get a ::leave signal even though the
      focus moves away from the widget, in certain cases (such as when the focus
      moves from the widget to a descendent). If you are interested in these
      cases, you can monitor the [Gtk.EventControllerFocus:is-focus] property
      for changes. *)

  (** {2:methods Methods} *)

  method contains_focus : unit -> bool
  (** Returns [TRUE] if focus is within [self] or one of its children. *)

  method is_focus : unit -> bool
  (** Returns [TRUE] if focus is within [self], but not one of its children. *)

  (** {2:conversions Conversions} *)

  method as_event_controller_focus : Raw.Event_controller_focus.t
end

class event_controller_focus :
  Raw.Event_controller_focus.t ->
  event_controller_focus_t
(** Wraps a raw handle of {!Ocgtk.Raw.Event_controller_focus.t}. *)

(** {1:description Description}

    Tracks keyboard focus.

    The event controller offers [Gtk.EventControllerFocus::enter] and
    [Gtk.EventControllerFocus::leave] signals, as well as
    [Gtk.EventControllerFocus:is-focus] and
    [Gtk.EventControllerFocus:contains-focus] properties which are updated to
    reflect focus changes inside the widget hierarchy that is rooted at the
    controllers widget. *)

(** {1:constructors Constructors} *)

val new_ : unit -> event_controller_focus_t
(** Creates a new event controller that will handle focus events. *)
