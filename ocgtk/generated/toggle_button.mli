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
 ]}\n\n\
 Its methods, signals and properties are on {!class-type-toggle_button_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Toggle_button}."]

(** The methods, signals and properties of a [GtkToggleButton]. *)
class type toggle_button_t = object
  inherit Button.button_t

  method on_toggled :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_active : unit -> bool
  method set_active : bool -> unit
  method set_group : toggle_button_t option -> unit
  method toggled : unit -> unit
  method as_toggle_button : Raw.Toggle_button.t
end

class toggle_button : Raw.Toggle_button.t -> toggle_button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Toggle_button.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkToggleButton], give one already wrapped. *)

val new_ : unit -> toggle_button_t
val new_with_label : string -> toggle_button_t
val new_with_mnemonic : string -> toggle_button_t
