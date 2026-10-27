(** Allows to enter or change numeric values.

    An example GtkSpinButton

    Rather than having to directly type a number into a [GtkEntry],
    [GtkSpinButton] allows the user to click on one of two arrows to increment
    or decrement the displayed value. A value can still be typed in, with the
    bonus that it can be checked to ensure it is in a given range.

    The main properties of a [GtkSpinButton] are through an adjustment. See the
    [Gtk.Adjustment] documentation for more details about an adjustment's
    properties.

    Note that [GtkSpinButton] will by default make its entry large enough to
    accommodate the lower and upper bounds of the adjustment. If this is not
    desired, the automatic sizing can be turned off by explicitly setting
    [Gtk.Editable:width-chars] to a value != -1.

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

    - [Gtk.SpinButton::change-value]

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

    [GtkSpinButton] uses the [Gtk.AccessibleRole.spin_button] role.

    Its methods, signals and properties are on {!class-type-spin_button_t}. The
    functions it is built on are in {!Ocgtk.Raw.Spin_button}. *)

(** The methods, signals and properties of a [GtkSpinButton]. *)
class type spin_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Cell_editable.cell_editable_t
  inherit Editable.editable_t
  inherit Orientable.orientable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_change_value :
    ?after:bool ->
    callback:(scroll:Enums.scrolltype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_output :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_value_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_wrapped :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method configure : Adjustment.adjustment_t option -> float -> int -> unit
  method get_activates_default : unit -> bool
  method get_adjustment : unit -> Adjustment.adjustment_t
  method get_climb_rate : unit -> float
  method get_digits : unit -> int
  method get_numeric : unit -> bool
  method get_snap_to_ticks : unit -> bool
  method get_update_policy : unit -> Enums.spinbuttonupdatepolicy
  method get_value : unit -> float
  method get_value_as_int : unit -> int
  method get_wrap : unit -> bool
  method set_activates_default : bool -> unit
  method set_adjustment : Adjustment.adjustment_t -> unit
  method set_climb_rate : float -> unit
  method set_digits : int -> unit
  method set_increments : float -> float -> unit
  method set_numeric : bool -> unit
  method set_range : float -> float -> unit
  method set_snap_to_ticks : bool -> unit
  method set_update_policy : Enums.spinbuttonupdatepolicy -> unit
  method set_value : float -> unit
  method set_wrap : bool -> unit
  method spin : Enums.spintype -> float -> unit
  method update : unit -> unit
  method as_spin_button : Raw.Spin_button.t
end

class spin_button : Raw.Spin_button.t -> spin_button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Spin_button.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkSpinButton], give one already wrapped. *)

val new_ : Adjustment.adjustment_t option -> float -> int -> spin_button_t
val new_with_range : float -> float -> float -> spin_button_t
