(** Allows to enter or change numeric values.

    Its methods, signals and properties are on {!class-type-spin_button_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Spin_button}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [SpinButton].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Accessible_range.class-type-accessible_range_t}Ocgtk.Accessible_range}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Cell_editable.class-type-cell_editable_t}Ocgtk.Cell_editable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.Editable.class-type-editable_t}Ocgtk.Editable}
    - {{!Ocgtk.Orientable.class-type-orientable_t}Ocgtk.Orientable}

    Allows to enter or change numeric values.

    An example GtkSpinButton

    Rather than having to directly type a number into a [GtkEntry],
    [GtkSpinButton] allows the user to click on one of two arrows to increment
    or decrement the displayed value. A value can still be typed in, with the
    bonus that it can be checked to ensure it is in a given range.

    The main properties of a [GtkSpinButton] are through an adjustment. See the
    {{!Ocgtk.Adjustment.class-type-adjustment_t}[Gtk.Adjustment]} documentation
    for more details about an adjustment's properties.

    Note that [GtkSpinButton] will by default make its entry large enough to
    accommodate the lower and upper bounds of the adjustment. If this is not
    desired, the automatic sizing can be turned off by explicitly setting
    {{!Ocgtk.Editable.class-type-editable_t.method-get_width_chars}[Gtk.Editable:width-chars]}
    to a value != -1.

    {b Using a GtkSpinButton to get an integer}

    {[
    // Provides a function to retrieve an integer value from a GtkSpinButton
    // and creates a spin button to model percentage values.

    int
    grab_int_value (GtkSpinButton *button,
                    gpointer       user_data)
    {
      return gtk_spin_button_get_value_as_int (button);
    }

    void
    create_integer_spin_button (void)
    {

      GtkWidget *window, *button;
      GtkAdjustment *adjustment;

      adjustment = gtk_adjustment_new (50.0, 0.0, 100.0, 1.0, 5.0, 0.0);

      window = gtk_window_new ();

      // creates the spinbutton, with no decimal places
      button = gtk_spin_button_new (adjustment, 1.0, 0);
      gtk_window_set_child (GTK_WINDOW (window), button);

      gtk_window_present (GTK_WINDOW (window));
    }
    ]}

    {b Using a GtkSpinButton to get a floating point value}

    {[
    // Provides a function to retrieve a floating point value from a
    // GtkSpinButton, and creates a high precision spin button.

    float
    grab_float_value (GtkSpinButton *button,
                      gpointer       user_data)
    {
      return gtk_spin_button_get_value (button);
    }

    void
    create_floating_spin_button (void)
    {
      GtkWidget *window, *button;
      GtkAdjustment *adjustment;

      adjustment = gtk_adjustment_new (2.500, 0.0, 5.0, 0.001, 0.1, 0.0);

      window = gtk_window_new ();

      // creates the spinbutton, with three decimal places
      button = gtk_spin_button_new (adjustment, 0.001, 3);
      gtk_window_set_child (GTK_WINDOW (window), button);

      gtk_window_present (GTK_WINDOW (window));
    }
    ]}

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - {{!Ocgtk.Spin_button.class-type-spin_button_t.method-on_change_value}[Gtk.SpinButton::change-value]}

    {b CSS nodes}

    {[
    spinbutton.horizontal
    ├── text
    │    ├── undershoot.left
    │    ╰── undershoot.right
    ├── button.down
    ╰── button.up
    ]}

    {[
    spinbutton.vertical
    ├── button.up
    ├── text
    │    ├── undershoot.left
    │    ╰── undershoot.right
    ╰── button.down
    ]}

    [GtkSpinButton]s main CSS node has the name spinbutton. It creates subnodes
    for the entry and the two buttons, with these names. The button nodes have
    the style classes .up and .down. The [GtkText] subnodes (if present) are put
    below the text node. The orientation of the spin button is reflected in the
    .vertical or .horizontal style class on the main node.

    {b Accessibility}

    [GtkSpinButton] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-SPIN_BUTTON}[Gtk.AccessibleRole.spin_button]}
    role. *)
class type spin_button_t = object
  inherit Widget.widget_t
  inherit Accessible_range.accessible_range_t
  inherit Cell_editable.cell_editable_t
  inherit Editable.editable_t
  inherit Orientable.orientable_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the spin button is activated.

      The keybindings for this signal are all forms of the <kbd>Enter</kbd> key.

      If the <kbd>Enter</kbd> key results in the value being committed to the
      spin button, then activation does not occur until <kbd>Enter</kbd> is
      pressed again. *)

  method on_change_value :
    ?after:bool ->
    callback:(scroll:Enums.scrolltype -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the user initiates a value change.

      This is a keybinding signal.

      Applications should not connect to it, but may emit it with
      [g_signal_emit_by_name ()] if they need to control the cursor
      programmatically.

      The default bindings for this signal are Up/Down and PageUp/PageDown. *)

  method on_output :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id
  [@@ocaml.doc
    "Emitted to tweak the formatting of the value for display.\n\n\
     {[\n\
     // show leading zeros\n\
     static gboolean\n\
     on_output (GtkSpinButton *spin,\n\
    \           gpointer       data)\n\
     {\n\
    \   char *text;\n\
    \   int value;\n\n\
    \   value = gtk_spin_button_get_value_as_int (spin);\n\
    \   text = g_strdup_printf (\"%02d\", value);\n\
    \   gtk_editable_set_text (GTK_EDITABLE (spin), text):\n\
    \   g_free (text);\n\n\
    \   return TRUE;\n\
     }\n\
     ]}"]

  method on_value_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the value is changed.

      Also see the [Gtk.SpinButton::output] signal. *)

  method on_wrapped :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted right after the spinbutton wraps from its maximum to its minimum
      value or vice-versa. *)

  (** {2:methods Methods} *)

  method configure : Adjustment.adjustment_t option -> float -> int -> unit
  (** Changes the properties of an existing spin button.

      The adjustment, climb rate, and number of decimal places are updated
      accordingly. *)

  method get_activates_default : unit -> bool
  (** Retrieves the value set by [Gtk.SpinButton.set_activates_default]. *)

  method get_adjustment : unit -> Adjustment.adjustment_t
  (** Get the adjustment associated with a [GtkSpinButton]. *)

  method get_climb_rate : unit -> float
  (** Returns the acceleration rate for repeated changes. *)

  method get_digits : unit -> int
  (** Fetches the precision of [spin_button]. *)

  method get_numeric : unit -> bool
  (** Returns whether non-numeric text can be typed into the spin button. *)

  method get_snap_to_ticks : unit -> bool
  (** Returns whether the values are corrected to the nearest step. *)

  method get_update_policy : unit -> Enums.spinbuttonupdatepolicy
  (** Gets the update behavior of a spin button.

      See [Gtk.SpinButton.set_update_policy]. *)

  method get_value : unit -> float
  (** Get the value in the [spin_button]. *)

  method get_value_as_int : unit -> int
  (** Get the value [spin_button] represented as an integer. *)

  method get_wrap : unit -> bool
  (** Returns whether the spin button’s value wraps around to the opposite limit
      when the upper or lower limit of the range is exceeded. *)

  method set_activates_default : bool -> unit
  (** Sets whether activating the spin button will activate the default widget
      for the window containing the spin button.

      See [Gtk.SpinButton::activate] for what counts as activation. *)

  method set_adjustment : Adjustment.adjustment_t -> unit
  (** Replaces the [GtkAdjustment] associated with [spin_button]. *)

  method set_climb_rate : float -> unit
  (** Sets the acceleration rate for repeated changes when you hold down a
      button or key. *)

  method set_digits : int -> unit
  (** Set the precision to be displayed by [spin_button].

      Up to 20 digit precision is allowed. *)

  method set_increments : float -> float -> unit
  (** Sets the step and page increments for spin_button.

      This affects how quickly the value changes when the spin button’s arrows
      are activated. *)

  method set_numeric : bool -> unit
  (** Sets the flag that determines if non-numeric text can be typed into the
      spin button. *)

  method set_range : float -> float -> unit
  (** Sets the minimum and maximum allowable values for [spin_button].

      If the current value is outside this range, it will be adjusted to fit
      within the range, otherwise it will remain unchanged. *)

  method set_snap_to_ticks : bool -> unit
  (** Sets the policy as to whether values are corrected to the nearest step
      increment when a spin button is activated after providing an invalid
      value. *)

  method set_update_policy : Enums.spinbuttonupdatepolicy -> unit
  (** Sets the update behavior of a spin button.

      This determines whether the spin button is always updated or only when a
      valid value is set. *)

  method set_value : float -> unit
  (** Sets the value of [spin_button]. *)

  method set_wrap : bool -> unit
  (** Sets the flag that determines if a spin button value wraps around to the
      opposite limit when the upper or lower limit of the range is exceeded. *)

  method spin : Enums.spintype -> float -> unit
  (** Increment or decrement a spin button’s value in a specified direction by a
      specified amount. *)

  method update : unit -> unit
  (** Manually force an update of the spin button. *)

  (** {2:conversions Conversions} *)

  method as_spin_button : Raw.Spin_button.t
end

class spin_button : Raw.Spin_button.t -> spin_button_t
(** Wraps a raw handle of {!Ocgtk.Raw.Spin_button.t}. *)

(** {1:description Description}

    Allows to enter or change numeric values.

    An example GtkSpinButton

    Rather than having to directly type a number into a [GtkEntry],
    [GtkSpinButton] allows the user to click on one of two arrows to increment
    or decrement the displayed value. A value can still be typed in, with the
    bonus that it can be checked to ensure it is in a given range.

    The main properties of a [GtkSpinButton] are through an adjustment. See the
    {{!Ocgtk.Adjustment.class-type-adjustment_t}[Gtk.Adjustment]} documentation
    for more details about an adjustment's properties.

    Note that [GtkSpinButton] will by default make its entry large enough to
    accommodate the lower and upper bounds of the adjustment. If this is not
    desired, the automatic sizing can be turned off by explicitly setting
    {{!Ocgtk.Editable.class-type-editable_t.method-get_width_chars}[Gtk.Editable:width-chars]}
    to a value != -1.

    {b Using a GtkSpinButton to get an integer}

    {[
    // Provides a function to retrieve an integer value from a GtkSpinButton
    // and creates a spin button to model percentage values.

    int
    grab_int_value (GtkSpinButton *button,
                    gpointer       user_data)
    {
      return gtk_spin_button_get_value_as_int (button);
    }

    void
    create_integer_spin_button (void)
    {

      GtkWidget *window, *button;
      GtkAdjustment *adjustment;

      adjustment = gtk_adjustment_new (50.0, 0.0, 100.0, 1.0, 5.0, 0.0);

      window = gtk_window_new ();

      // creates the spinbutton, with no decimal places
      button = gtk_spin_button_new (adjustment, 1.0, 0);
      gtk_window_set_child (GTK_WINDOW (window), button);

      gtk_window_present (GTK_WINDOW (window));
    }
    ]}

    {b Using a GtkSpinButton to get a floating point value}

    {[
    // Provides a function to retrieve a floating point value from a
    // GtkSpinButton, and creates a high precision spin button.

    float
    grab_float_value (GtkSpinButton *button,
                      gpointer       user_data)
    {
      return gtk_spin_button_get_value (button);
    }

    void
    create_floating_spin_button (void)
    {
      GtkWidget *window, *button;
      GtkAdjustment *adjustment;

      adjustment = gtk_adjustment_new (2.500, 0.0, 5.0, 0.001, 0.1, 0.0);

      window = gtk_window_new ();

      // creates the spinbutton, with three decimal places
      button = gtk_spin_button_new (adjustment, 0.001, 3);
      gtk_window_set_child (GTK_WINDOW (window), button);

      gtk_window_present (GTK_WINDOW (window));
    }
    ]}

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - {{!Ocgtk.Spin_button.class-type-spin_button_t.method-on_change_value}[Gtk.SpinButton::change-value]}

    {b CSS nodes}

    {[
    spinbutton.horizontal
    ├── text
    │    ├── undershoot.left
    │    ╰── undershoot.right
    ├── button.down
    ╰── button.up
    ]}

    {[
    spinbutton.vertical
    ├── button.up
    ├── text
    │    ├── undershoot.left
    │    ╰── undershoot.right
    ╰── button.down
    ]}

    [GtkSpinButton]s main CSS node has the name spinbutton. It creates subnodes
    for the entry and the two buttons, with these names. The button nodes have
    the style classes .up and .down. The [GtkText] subnodes (if present) are put
    below the text node. The orientation of the spin button is reflected in the
    .vertical or .horizontal style class on the main node.

    {b Accessibility}

    [GtkSpinButton] uses the
    {{!Ocgtk.Enums.type-accessiblerole.constructor-SPIN_BUTTON}[Gtk.AccessibleRole.spin_button]}
    role. *)

(** {1:constructors Constructors} *)

val new_ : Adjustment.adjustment_t option -> float -> int -> spin_button_t
(** Creates a new [GtkSpinButton]. *)

val new_with_range : float -> float -> float -> spin_button_t
(** Creates a new [GtkSpinButton] with the given properties.

    This is a convenience constructor that allows creation of a numeric
    [GtkSpinButton] without manually creating an adjustment. The value is
    initially set to the minimum value and a page increment of 10 * [step] is
    the default. The precision of the spin button is equivalent to the precision
    of [step].

    Note that the way in which the precision is derived works best if [step] is
    a power of ten. If the resulting precision is not suitable for your needs,
    use
    {{!Ocgtk.Spin_button.class-type-spin_button_t.method-set_digits}[Gtk.SpinButton.set_digits]}
    to correct it. *)
