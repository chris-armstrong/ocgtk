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
 [GtkExpander] uses the [Gtk.AccessibleRole.button] role.\n\n\
 Its methods, signals and properties are on {!class-type-expander_t}. Its \
 constructors are under {!section-constructors}. The functions it is built on \
 are in {!Ocgtk.Raw.Expander}."]

(** The methods, signals and properties of a [GtkExpander]. *)
class type expander_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Activates the [GtkExpander]. *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child widget of [expander]. *)

  method get_expanded : unit -> bool
  (** Queries a [GtkExpander] and returns its current state.

      Returns [TRUE] if the child widget is revealed. *)

  method get_label : unit -> string option
  (** Fetches the text from a label widget.

      This is including any embedded underlines indicating mnemonics and Pango
      markup, as set by [Gtk.Expander.set_label]. If the label text has not been
      set the return value will be [NULL]. This will be the case if you create
      an empty button with gtk_button_new() to use as a container. *)

  method get_label_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Retrieves the label widget for the frame. *)

  method get_resize_toplevel : unit -> bool
  (** Returns whether the expander will resize the toplevel widget containing
      the expander upon resizing and collapsing. *)

  method get_use_markup : unit -> bool
  (** Returns whether the label’s text is interpreted as Pango markup. *)

  method get_use_underline : unit -> bool
  (** Returns whether an underline in the text indicates a mnemonic. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child widget of [expander]. *)

  method set_expanded : bool -> unit
  (** Sets the state of the expander.

      Set to [TRUE], if you want the child widget to be revealed, and [FALSE] if
      you want the child widget to be hidden. *)

  method set_label : string option -> unit
  (** Sets the text of the label of the expander to [label].

      This will also clear any previously set labels. *)

  method set_label_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Set the label widget for the expander.

      This is the widget that will appear embedded alongside the expander arrow.
  *)

  method set_resize_toplevel : bool -> unit
  (** Sets whether the expander will resize the toplevel widget containing the
      expander upon resizing and collapsing. *)

  method set_use_markup : bool -> unit
  (** Sets whether the text of the label contains Pango markup. *)

  method set_use_underline : bool -> unit
  (** If true, an underline in the text indicates a mnemonic. *)

  method as_expander : Raw.Expander.t
end

class expander : Raw.Expander.t -> expander_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Expander.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkExpander], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : string option -> expander_t
(** Creates a new expander using [label] as the text of the label. *)

val new_with_mnemonic : string option -> expander_t
(** Creates a new expander using [label] as the text of the label.

    If characters in [label] are preceded by an underscore, they are underlined.
    If you need a literal underscore character in a label, use “__” (two
    underscores). The first underlined character represents a keyboard
    accelerator called a mnemonic.

    Pressing Alt and that key activates the button. *)
