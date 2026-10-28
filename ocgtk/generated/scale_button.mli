(** Provides a button which pops up a scale widget.

    Its methods, signals and properties are on {!class-type-scale_button_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Scale_button}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ScaleButton].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Accessible_range.class-type-accessible_range_t}Ocgtk.Accessible_range}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.Orientable.class-type-orientable_t}Ocgtk.Orientable}

    Provides a button which pops up a scale widget.

    This kind of widget is commonly used for volume controls in multimedia
    applications, and GTK provides a [Gtk.VolumeButton] subclass that is
    tailored for this use case.

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - [Gtk.ScaleButton::popup]

    {b CSS nodes}

    {[
    scalebutton.scale
    ╰── button.toggle
        ╰── <icon>
    ]}

    [GtkScaleButton] has a single CSS node with name scalebutton and [.scale]
    style class, and contains a [button] node with a [.toggle] style class. *)
class type scale_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  (** {2:signals Signals} *)

  method on_popdown :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to dismiss the popup.

      This is a keybinding signal.

      The default binding for this signal is <kbd>Escape</kbd>. *)

  method on_popup :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to popup the scale widget.

      This is a keybinding signal.

      The default bindings for this signal are <kbd>Space</kbd>,
      <kbd>Enter</kbd> and <kbd>Return</kbd>. *)

  method on_value_changed :
    ?after:bool ->
    callback:(value:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the value field has changed. *)

  (** {2:methods Methods} *)

  method get_active : unit -> bool
  (** Queries a [GtkScaleButton] and returns its current state.

      Returns [TRUE] if the scale button is pressed in and [FALSE] if it is
      raised. *)

  method get_adjustment : unit -> Adjustment.adjustment_t
  (** Gets the [GtkAdjustment] associated with the [GtkScaleButton]’s scale.

      See [Gtk.Range.get_adjustment] for details. *)

  method get_has_frame : unit -> bool
  (** Returns whether the button has a frame. *)

  method get_minus_button : unit -> Button.button_t
  (** Retrieves the minus button of the [GtkScaleButton]. *)

  method get_plus_button : unit -> Button.button_t
  (** Retrieves the plus button of the [GtkScaleButton.] *)

  method get_popup :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Retrieves the popup of the [GtkScaleButton]. *)

  method get_value : unit -> float
  (** Gets the current value of the scale button. *)

  method set_adjustment : Adjustment.adjustment_t -> unit
  (** Sets the [GtkAdjustment] to be used as a model for the [GtkScaleButton]’s
      scale.

      See [Gtk.Range.set_adjustment] for details. *)

  method set_has_frame : bool -> unit
  (** Sets the style of the button. *)

  method set_icons : string array -> unit
  (** Sets the icons to be used by the scale button. *)

  method set_value : float -> unit
  (** Sets the current value of the scale.

      If the value is outside the minimum or maximum range values, it will be
      clamped to fit inside them.

      The scale button emits the [Gtk.ScaleButton::value-changed] signal if the
      value changes. *)

  (** {2:conversions Conversions} *)

  method as_scale_button : Raw.Scale_button.t
end

class scale_button : Raw.Scale_button.t -> scale_button_t
(** Wraps a raw handle of {!Ocgtk.Raw.Scale_button.t}. *)

(** {1:description Description}

    Provides a button which pops up a scale widget.

    This kind of widget is commonly used for volume controls in multimedia
    applications, and GTK provides a [Gtk.VolumeButton] subclass that is
    tailored for this use case.

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - [Gtk.ScaleButton::popup]

    {b CSS nodes}

    {[
    scalebutton.scale
    ╰── button.toggle
        ╰── <icon>
    ]}

    [GtkScaleButton] has a single CSS node with name scalebutton and [.scale]
    style class, and contains a [button] node with a [.toggle] style class. *)

(** {1:constructors Constructors} *)

val new_ : float -> float -> float -> string array option -> scale_button_t
(** Creates a [GtkScaleButton].

    The new scale button has a range between [min] and [max], with a stepping of
    [step]. *)
