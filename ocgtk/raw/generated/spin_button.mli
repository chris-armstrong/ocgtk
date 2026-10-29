(* GENERATED CODE - DO NOT EDIT *)
(* SpinButton: SpinButton *)

(** Allows to enter or change numeric values.

    An example GtkSpinButton

    Rather than having to directly type a number into a [GtkEntry],
    [GtkSpinButton] allows the user to click on one of two arrows to increment
    or decrement the displayed value. A value can still be typed in, with the
    bonus that it can be checked to ensure it is in a given range.

    The main properties of a [GtkSpinButton] are through an adjustment. See the
    {{!Ocgtk.Raw.Adjustment}[Gtk.Adjustment]} documentation for more details
    about an adjustment's properties.

    Note that [GtkSpinButton] will by default make its entry large enough to
    accommodate the lower and upper bounds of the adjustment. If this is not
    desired, the automatic sizing can be turned off by explicitly setting
    {{!Ocgtk.Raw.Editable.val-get_width_chars}[Gtk.Editable:width-chars]} to a
    value != -1.

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

    - {{!Ocgtk.Raw.Spin_button.val-on_change_value}[Gtk.SpinButton::change-value]}

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
    role.

    The class built on this module is in {!Ocgtk.Spin_button}. *)

type t = [ `spin_button | `widget | `initially_unowned | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_spin_button_get_type"

external new_ : Adjustment.t option -> float -> int -> t
  = "ml_gtk_spin_button_new"
(** Creates a new [GtkSpinButton]. *)

external new_with_range : float -> float -> float -> t
  = "ml_gtk_spin_button_new_with_range"
(** Creates a new [GtkSpinButton] with the given properties.

    This is a convenience constructor that allows creation of a numeric
    [GtkSpinButton] without manually creating an adjustment. The value is
    initially set to the minimum value and a page increment of 10 * [step] is
    the default. The precision of the spin button is equivalent to the precision
    of [step].

    Note that the way in which the precision is derived works best if [step] is
    a power of ten. If the resulting precision is not suitable for your needs,
    use {{!Ocgtk.Raw.Spin_button.val-set_digits}[Gtk.SpinButton.set_digits]} to
    correct it. *)

(* Methods *)

external update : t -> unit = "ml_gtk_spin_button_update"
(** Manually force an update of the spin button. *)

external spin : t -> Ocgtk_enums.spintype -> float -> unit
  = "ml_gtk_spin_button_spin"
(** Increment or decrement a spin button’s value in a specified direction by a
    specified amount. *)

external set_wrap : t -> bool -> unit = "ml_gtk_spin_button_set_wrap"
(** Sets the flag that determines if a spin button value wraps around to the
    opposite limit when the upper or lower limit of the range is exceeded. *)

external set_value : t -> float -> unit = "ml_gtk_spin_button_set_value"
(** Sets the value of [spin_button]. *)

external set_update_policy : t -> Ocgtk_enums.spinbuttonupdatepolicy -> unit
  = "ml_gtk_spin_button_set_update_policy"
(** Sets the update behavior of a spin button.

    This determines whether the spin button is always updated or only when a
    valid value is set. *)

external set_snap_to_ticks : t -> bool -> unit
  = "ml_gtk_spin_button_set_snap_to_ticks"
(** Sets the policy as to whether values are corrected to the nearest step
    increment when a spin button is activated after providing an invalid value.
*)

external set_range : t -> float -> float -> unit
  = "ml_gtk_spin_button_set_range"
(** Sets the minimum and maximum allowable values for [spin_button].

    If the current value is outside this range, it will be adjusted to fit
    within the range, otherwise it will remain unchanged. *)

external set_numeric : t -> bool -> unit = "ml_gtk_spin_button_set_numeric"
(** Sets the flag that determines if non-numeric text can be typed into the spin
    button. *)

external set_increments : t -> float -> float -> unit
  = "ml_gtk_spin_button_set_increments"
(** Sets the step and page increments for spin_button.

    This affects how quickly the value changes when the spin button’s arrows are
    activated. *)

external set_digits : t -> int -> unit = "ml_gtk_spin_button_set_digits"
(** Set the precision to be displayed by [spin_button].

    Up to 20 digit precision is allowed. *)

external set_climb_rate : t -> float -> unit
  = "ml_gtk_spin_button_set_climb_rate"
(** Sets the acceleration rate for repeated changes when you hold down a button
    or key. *)

external set_adjustment : t -> Adjustment.t -> unit
  = "ml_gtk_spin_button_set_adjustment"
(** Replaces the [GtkAdjustment] associated with [spin_button]. *)

external set_activates_default : t -> bool -> unit
  = "ml_gtk_spin_button_set_activates_default"
(** Sets whether activating the spin button will activate the default widget for
    the window containing the spin button.

    See {{!Ocgtk.Raw.Spin_button.val-on_activate}[Gtk.SpinButton::activate]} for
    what counts as activation. *)

external get_wrap : t -> bool = "ml_gtk_spin_button_get_wrap"
(** Returns whether the spin button’s value wraps around to the opposite limit
    when the upper or lower limit of the range is exceeded. *)

external get_value_as_int : t -> int = "ml_gtk_spin_button_get_value_as_int"
(** Get the value [spin_button] represented as an integer. *)

external get_value : t -> float = "ml_gtk_spin_button_get_value"
(** Get the value in the [spin_button]. *)

external get_update_policy : t -> Ocgtk_enums.spinbuttonupdatepolicy
  = "ml_gtk_spin_button_get_update_policy"
(** Gets the update behavior of a spin button.

    See
    {{!Ocgtk.Raw.Spin_button.val-set_update_policy}[Gtk.SpinButton.set_update_policy]}.
*)

external get_snap_to_ticks : t -> bool = "ml_gtk_spin_button_get_snap_to_ticks"
(** Returns whether the values are corrected to the nearest step. *)

external get_range : t -> float * float = "ml_gtk_spin_button_get_range"
(** Gets the range allowed for [spin_button].

    See {{!Ocgtk.Raw.Spin_button.val-set_range}[Gtk.SpinButton.set_range]}. *)

external get_numeric : t -> bool = "ml_gtk_spin_button_get_numeric"
(** Returns whether non-numeric text can be typed into the spin button. *)

external get_increments : t -> float * float
  = "ml_gtk_spin_button_get_increments"
(** Gets the current step and page the increments used by [spin_button].

    See
    {{!Ocgtk.Raw.Spin_button.val-set_increments}[Gtk.SpinButton.set_increments]}.
*)

external get_digits : t -> int = "ml_gtk_spin_button_get_digits"
(** Fetches the precision of [spin_button]. *)

external get_climb_rate : t -> float = "ml_gtk_spin_button_get_climb_rate"
(** Returns the acceleration rate for repeated changes. *)

external get_adjustment : t -> Adjustment.t
  = "ml_gtk_spin_button_get_adjustment"
(** Get the adjustment associated with a [GtkSpinButton]. *)

external get_activates_default : t -> bool
  = "ml_gtk_spin_button_get_activates_default"
(** Retrieves the value set by
    {{!Ocgtk.Raw.Spin_button.val-set_activates_default}[Gtk.SpinButton.set_activates_default]}.
*)

external configure : t -> Adjustment.t option -> float -> int -> unit
  = "ml_gtk_spin_button_configure"
(** Changes the properties of an existing spin button.

    The adjustment, climb rate, and number of decimal places are updated
    accordingly. *)

(* Properties *)

val on_activate :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted when the spin button is activated.

    The keybindings for this signal are all forms of the <kbd>Enter</kbd> key.

    If the <kbd>Enter</kbd> key results in the value being committed to the spin
    button, then activation does not occur until <kbd>Enter</kbd> is pressed
    again. *)

val on_change_value :
  ?after:bool ->
  t ->
  callback:(scroll:Ocgtk_enums.scrolltype -> unit) ->
  Gobject.Signal.handler_id
(** Emitted when the user initiates a value change.

    This is a keybinding signal.

    Applications should not connect to it, but may emit it with
    g_signal_emit_by_name() if they need to control the cursor programmatically.

    The default bindings for this signal are Up/Down and PageUp/PageDown. *)

val on_output :
  ?after:bool -> t -> callback:(unit -> bool) -> Gobject.Signal.handler_id
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

val on_value_changed :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted when the value is changed.

    Also see the
    {{!Ocgtk.Raw.Spin_button.val-on_output}[Gtk.SpinButton::output]} signal. *)

val on_wrapped :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted right after the spinbutton wraps from its maximum to its minimum
    value or vice-versa. *)
