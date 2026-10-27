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
 Its methods, signals and properties are on {!class-type-expander_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Expander}."]

(** The methods, signals and properties of a [GtkExpander]. *)
class type expander_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_expanded : unit -> bool
  method get_label : unit -> string option

  method get_label_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_resize_toplevel : unit -> bool
  method get_use_markup : unit -> bool
  method get_use_underline : unit -> bool

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_expanded : bool -> unit
  method set_label : string option -> unit

  method set_label_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_resize_toplevel : bool -> unit
  method set_use_markup : bool -> unit
  method set_use_underline : bool -> unit
  method as_expander : Raw.Expander.t
end

class expander : Raw.Expander.t -> expander_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Expander.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkExpander], give one already wrapped. *)

val new_ : string option -> expander_t
val new_with_mnemonic : string option -> expander_t
