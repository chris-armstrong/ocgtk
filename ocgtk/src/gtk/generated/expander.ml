(* GENERATED CODE - DO NOT EDIT *)
(* Expander: Expander *)

[@@@ocaml.text
"Allows the user to reveal or conceal a child widget.\n\n\
 An example GtkExpander\n\n\
 This is similar to the triangles used in a [GtkTreeView].\n\n\
 Normally you use an expander as you would use a frame; you create\n\
 the child widget and use [Gtk.Expander.set_child] to add it\n\
 to the expander. When the expander is toggled, it will take care of\n\
 showing and hiding the child automatically.\n\n\
 {b Special Usage}\n\n\
 There are situations in which you may prefer to show and hide the\n\
 expanded widget yourself, such as when you want to actually create\n\
 the widget at expansion time. In this case, create a [GtkExpander]\n\
 but do not add a child to it. The expander widget has an\n\
 [Gtk.Expander:expanded] property which can be used to\n\
 monitor its expansion state. You should watch this property with\n\
 a signal connection as follows:\n\n\
 {[\n\
 static void\n\
 expander_callback (GObject    *object,\n\
\                   GParamSpec *param_spec,\n\
\                   gpointer    user_data)\n\
 {\n\
\  GtkExpander *expander;\n\n\
\  expander = GTK_EXPANDER (object);\n\n\
\  if (gtk_expander_get_expanded (expander))\n\
\    {\n\
\      // Show or create widgets\n\
\    }\n\
\  else\n\
\    {\n\
\      // Hide or destroy widgets\n\
\    }\n\
 }\n\n\
 static void\n\
 create_expander (void)\n\
 {\n\
\  GtkWidget *expander = gtk_expander_new_with_mnemonic (\"_More Options\");\n\
\  g_signal_connect (expander, \"notify::expanded\",\n\
\                    G_CALLBACK (expander_callback), NULL);\n\n\
\  // ...\n\
 }\n\
 ]}\n\n\
 {b GtkExpander as GtkBuildable}\n\n\
 An example of a UI definition fragment with GtkExpander:\n\n\
 {[\n\
 <object class=\"GtkExpander\">\n\
\  <property name=\"label-widget\">\n\
\    <object class=\"GtkLabel\" id=\"expander-label\"/>\n\
\  </property>\n\
\  <property name=\"child\">\n\
\    <object class=\"GtkEntry\" id=\"expander-content\"/>\n\
\  </property>\n\
 </object>\n\
 ]}\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 expander-widget\n\
 ╰── box\n\
\    ├── title\n\
\    │   ├── expander\n\
\    │   ╰── <label widget>\n\
\    ╰── <child>\n\
 ]}\n\n\
 [GtkExpander] has a main node [expander-widget], and subnode [box] containing\n\
 the title and child widget. The box subnode [title] contains node [expander],\n\
 i.e. the expand/collapse arrow; then the label widget if any. The arrow of an\n\
 expander that is showing its child gets the [:checked] pseudoclass set on it.\n\n\
 {b Accessibility}\n\n\
 [GtkExpander] uses the [Gtk.AccessibleRole.button] role."]

type t = [ `expander | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : string option -> t = "ml_gtk_expander_new"
(** Create a new Expander *)

external new_with_mnemonic : string option -> t
  = "ml_gtk_expander_new_with_mnemonic"
(** Create a new Expander *)

(* Methods *)

external set_use_underline : t -> bool -> unit
  = "ml_gtk_expander_set_use_underline"
(** If true, an underline in the text indicates a mnemonic. *)

external set_use_markup : t -> bool -> unit = "ml_gtk_expander_set_use_markup"
(** Sets whether the text of the label contains Pango markup. *)

external set_resize_toplevel : t -> bool -> unit
  = "ml_gtk_expander_set_resize_toplevel"
(** Sets whether the expander will resize the toplevel widget containing the
    expander upon resizing and collapsing. *)

external set_label_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_expander_set_label_widget"
(** Set the label widget for the expander.

    This is the widget that will appear embedded alongside the expander arrow.
*)

external set_label : t -> string option -> unit = "ml_gtk_expander_set_label"
(** Sets the text of the label of the expander to [label].

    This will also clear any previously set labels. *)

external set_expanded : t -> bool -> unit = "ml_gtk_expander_set_expanded"
(** Sets the state of the expander.

    Set to [TRUE], if you want the child widget to be revealed, and [FALSE] if
    you want the child widget to be hidden. *)

external set_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_expander_set_child"
(** Sets the child widget of [expander]. *)

external get_use_underline : t -> bool = "ml_gtk_expander_get_use_underline"
(** Returns whether an underline in the text indicates a mnemonic. *)

external get_use_markup : t -> bool = "ml_gtk_expander_get_use_markup"
(** Returns whether the label’s text is interpreted as Pango markup. *)

external get_resize_toplevel : t -> bool = "ml_gtk_expander_get_resize_toplevel"
(** Returns whether the expander will resize the toplevel widget containing the
    expander upon resizing and collapsing. *)

external get_label_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_expander_get_label_widget"
(** Retrieves the label widget for the frame. *)

external get_label : t -> string option = "ml_gtk_expander_get_label"
(** Fetches the text from a label widget.

    This is including any embedded underlines indicating mnemonics and Pango
    markup, as set by [Gtk.Expander.set_label]. If the label text has not been
    set the return value will be [NULL]. This will be the case if you create an
    empty button with gtk_button_new() to use as a container. *)

external get_expanded : t -> bool = "ml_gtk_expander_get_expanded"
(** Queries a [GtkExpander] and returns its current state.

    Returns [TRUE] if the child widget is revealed. *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_expander_get_child"
(** Gets the child widget of [expander]. *)

(* Properties *)

let on_activate ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"activate" ~callback
    ~after:(Option.value after ~default:false)
