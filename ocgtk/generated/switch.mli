[@@@ocaml.text
"Shows a \"light switch\" that has two states: on or off.\n\n\
 An example GtkSwitch\n\n\
 The user can control which state should be active by clicking the\n\
 empty area, or by dragging the slider.\n\n\
 [GtkSwitch] can also express situations where the underlying state changes\n\
 with a delay. In this case, the slider position indicates the user's recent\n\
 change (represented by the [Gtk.Switch:active] property), while the\n\
 trough color indicates the present underlying state (represented by the\n\
 [Gtk.Switch:state] property).\n\n\
 GtkSwitch with delayed state change\n\n\
 See [Gtk.Switch::state-set] for details.\n\n\
 {b Shortcuts and Gestures}\n\n\
 [GtkSwitch] supports pan and drag gestures to move the slider.\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 switch\n\
 ├── image\n\
 ├── image\n\
 ╰── slider\n\
 ]}\n\n\
 [GtkSwitch] has four css nodes, the main node with the name switch and\n\
 subnodes for the slider and the on and off images. Neither of them is\n\
 using any style classes.\n\n\
 {b Accessibility}\n\n\
 [GtkSwitch] uses the [Gtk.AccessibleRole.switch] role.\n\n\
 Its methods, signals and properties are on {!class-type-switch_t}. Its \
 constructors are under {!section-constructors}. The functions it is built on \
 are in {!Ocgtk.Raw.Switch}."]

(** The methods, signals and properties of a [GtkSwitch]. *)
class type switch_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Actionable.actionable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_state_set :
    ?after:bool ->
    callback:(state:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method get_active : unit -> bool
  (** Gets whether the [GtkSwitch] is in its “on” or “off” state. *)

  method get_state : unit -> bool
  (** Gets the underlying state of the [GtkSwitch]. *)

  method set_active : bool -> unit
  (** Changes the state of [self] to the desired one. *)

  method set_state : bool -> unit
  (** Sets the underlying state of the [GtkSwitch].

      This function is typically called from a [Gtk.Switch::state-set] signal
      handler in order to set up delayed state changes.

      See [Gtk.Switch::state-set] for details. *)

  method as_switch : Raw.Switch.t
end

class switch : Raw.Switch.t -> switch_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Switch.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkSwitch], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> switch_t
(** Creates a new [GtkSwitch] widget. *)
