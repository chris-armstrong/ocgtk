[@@@ocaml.text
"Shows a \"light switch\" that has two states: on or off.\n\n\
 Its methods, signals and properties are on {!class-type-switch_t}. Its full \
 description is under {!section-description}. Its constructors are under \
 {!section-constructors}. The functions it is built on are in \
 {!Ocgtk.Raw.Switch}."]

(** {1:class Class} *)

class type switch_t = object
  inherit Widget.widget_t
  inherit Actionable.actionable_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to animate the switch.

      Applications should never connect to this signal, but use the
      [Gtk.Switch:active] property. *)

  method on_state_set :
    ?after:bool ->
    callback:(state:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted to change the underlying state.

      The ::state-set signal is emitted when the user changes the switch
      position. The default handler calls [Gtk.Switch.set_state] with the value
      of [state].

      To implement delayed state change, applications can connect to this
      signal, initiate the change of the underlying state, and call
      [Gtk.Switch.set_state] when the underlying state change is complete. The
      signal handler should return [true] to prevent the default handler from
      running. *)

  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_switch : Raw.Switch.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [Switch].}\n\n\
     Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}\n\n\
     Implements:\n\
     - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}\n\
     - {{!Ocgtk.Actionable.class-type-actionable_t}Ocgtk.Actionable}\n\
     - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}\n\
     - \
     {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}\n\n\
     Shows a \"light switch\" that has two states: on or off.\n\n\
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
     [GtkSwitch] uses the [Gtk.AccessibleRole.switch] role."]

class switch : Raw.Switch.t -> switch_t
(** Wraps a raw handle of {!Ocgtk.Raw.Switch.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Shows a \"light switch\" that has two states: on or off.\n\n\
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
 [GtkSwitch] uses the [Gtk.AccessibleRole.switch] role."]

(** {1:constructors Constructors} *)

val new_ : unit -> switch_t
(** Creates a new [GtkSwitch] widget. *)
