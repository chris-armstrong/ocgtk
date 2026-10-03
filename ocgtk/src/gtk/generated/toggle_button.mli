(* GENERATED CODE - DO NOT EDIT *)
(* ToggleButton: ToggleButton *)

(** Shows a button which remains “pressed-in” when clicked.

    Example GtkToggleButtons

    Clicking again will cause the toggle button to return to its normal state.

    A toggle button is created by calling either [Gtk.ToggleButton.new] or
    [Gtk.ToggleButton.new_with_label]. If using the former, it is advisable to
    pack a widget, (such as a [GtkLabel] and/or a [GtkImage]), into the toggle
    button’s container. (See [Gtk.Button] for more information).

    The state of a [GtkToggleButton] can be set specifically using
    [Gtk.ToggleButton.set_active], and retrieved using
    [Gtk.ToggleButton.get_active].

    {b Grouping}

    Toggle buttons can be grouped together, to form mutually exclusive groups -
    only one of the buttons can be toggled at a time, and toggling another one
    will switch the currently toggled one off.

    To add a [GtkToggleButton] to a group, use [Gtk.ToggleButton.set_group].

    {b CSS nodes}

    [GtkToggleButton] has a single CSS node with name button. To differentiate
    it from a plain [GtkButton], it gets the [.toggle] style class.

    {b Accessibility}

    [GtkToggleButton] uses the [Gtk.AccessibleRole.toggle_button] role.

    {b Creating two [GtkToggleButton] widgets.}

    {[
    static void
    output_state (GtkToggleButton *source,
                  gpointer         user_data)
    {
      g_print (“Toggle button “%s” is active: %s”,
               gtk_button_get_label (GTK_BUTTON (source)),
               gtk_toggle_button_get_active (source) ? “Yes” : “No”);
    }

    static void
    make_toggles (void)
    {
      GtkWidget *window, *toggle1, *toggle2;
      GtkWidget *box;
      const char *text;

      window = gtk_window_new ();
      box = gtk_box_new (GTK_ORIENTATION_VERTICAL, 12);

      text = “Hi, I’m toggle button one”;
      toggle1 = gtk_toggle_button_new_with_label (text);

      g_signal_connect (toggle1, “toggled”,
                        G_CALLBACK (output_state),
                        NULL);
      gtk_box_append (GTK_BOX (box), toggle1);

      text = “Hi, I’m toggle button two”;
      toggle2 = gtk_toggle_button_new_with_label (text);
      g_signal_connect (toggle2, “toggled”,
                        G_CALLBACK (output_state),
                        NULL);
      gtk_box_append (GTK_BOX (box), toggle2);

      gtk_window_set_child (GTK_WINDOW (window), box);
      gtk_window_present (GTK_WINDOW (window));
    }
    ]} *)

type t =
  [ `toggle_button | `button | `widget | `initially_unowned | `object_ ]
  Gobject.obj

external new_ : unit -> t = "ml_gtk_toggle_button_new"
(** Create a new ToggleButton *)

external new_with_label : string -> t = "ml_gtk_toggle_button_new_with_label"
(** Create a new ToggleButton *)

external new_with_mnemonic : string -> t
  = "ml_gtk_toggle_button_new_with_mnemonic"
(** Create a new ToggleButton *)

(* Methods *)

external toggled : t -> unit = "ml_gtk_toggle_button_toggled"
(** Emits the ::toggled signal on the [GtkToggleButton]. *)

external set_group : t -> t option -> unit = "ml_gtk_toggle_button_set_group"
(** Adds [self] to the group of [group].

    In a group of multiple toggle buttons, only one button can be active at a
    time.

    Setting up groups in a cycle leads to undefined behavior.

    Note that the same effect can be achieved via the [Gtk.Actionable] API, by
    using the same action with parameter type and state type 's' for all buttons
    in the group, and giving each button its own target value. *)

external set_active : t -> bool -> unit = "ml_gtk_toggle_button_set_active"
(** Sets the status of the toggle button.

    Set to [TRUE] if you want the [GtkToggleButton] to be “pressed in”, and
    [FALSE] to raise it.

    If the status of the button changes, this action causes the
    [Gtk.ToggleButton::toggled] signal to be emitted. *)

external get_active : t -> bool = "ml_gtk_toggle_button_get_active"
(** Queries a [GtkToggleButton] and returns its current state.

    Returns [TRUE] if the toggle button is pressed in and [FALSE] if it is
    raised. *)

(* Properties *)

val on_toggled :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
