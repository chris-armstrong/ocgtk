(* GENERATED CODE - DO NOT EDIT *)
(* ToggleButton: ToggleButton *)

[@@@ocaml.text
"Shows a button which remains “pressed-in” when clicked.\n\n\
 Example GtkToggleButtons\n\n\
 Clicking again will cause the toggle button to return to its normal state.\n\n\
 A toggle button is created by calling either [Gtk.ToggleButton.new] or\n\
 [Gtk.ToggleButton.new_with_label]. If using the former, it is advisable\n\
 to pack a widget, (such as a [GtkLabel] and/or a [GtkImage]), into the toggle\n\
 button’s container. (See [Gtk.Button] for more information).\n\n\
 The state of a [GtkToggleButton] can be set specifically using\n\
 [Gtk.ToggleButton.set_active], and retrieved using\n\
 [Gtk.ToggleButton.get_active].\n\n\
 {b Grouping}\n\n\
 Toggle buttons can be grouped together, to form mutually exclusive\n\
 groups - only one of the buttons can be toggled at a time, and toggling\n\
 another one will switch the currently toggled one off.\n\n\
 To add a [GtkToggleButton] to a group, use [Gtk.ToggleButton.set_group].\n\n\
 {b CSS nodes}\n\n\
 [GtkToggleButton] has a single CSS node with name button. To differentiate\n\
 it from a plain [GtkButton], it gets the [.toggle] style class.\n\n\
 {b Accessibility}\n\n\
 [GtkToggleButton] uses the [Gtk.AccessibleRole.toggle_button] role.\n\n\
 {b Creating two [GtkToggleButton] widgets.}\n\n\
 {[\n\
 static void\n\
 output_state (GtkToggleButton *source,\n\
\              gpointer         user_data)\n\
 {\n\
\  g_print (\"Toggle button \"%s\" is active: %s\",\n\
\           gtk_button_get_label (GTK_BUTTON (source)),\n\
\           gtk_toggle_button_get_active (source) ? \"Yes\" : \"No\");\n\
 }\n\n\
 static void\n\
 make_toggles (void)\n\
 {\n\
\  GtkWidget *window, *toggle1, *toggle2;\n\
\  GtkWidget *box;\n\
\  const char *text;\n\n\
\  window = gtk_window_new ();\n\
\  box = gtk_box_new (GTK_ORIENTATION_VERTICAL, 12);\n\n\
\  text = \"Hi, I’m toggle button one\";\n\
\  toggle1 = gtk_toggle_button_new_with_label (text);\n\n\
\  g_signal_connect (toggle1, \"toggled\",\n\
\                    G_CALLBACK (output_state),\n\
\                    NULL);\n\
\  gtk_box_append (GTK_BOX (box), toggle1);\n\n\
\  text = \"Hi, I’m toggle button two\";\n\
\  toggle2 = gtk_toggle_button_new_with_label (text);\n\
\  g_signal_connect (toggle2, \"toggled\",\n\
\                    G_CALLBACK (output_state),\n\
\                    NULL);\n\
\  gtk_box_append (GTK_BOX (box), toggle2);\n\n\
\  gtk_window_set_child (GTK_WINDOW (window), box);\n\
\  gtk_window_present (GTK_WINDOW (window));\n\
 }\n\
 ]}"]

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
