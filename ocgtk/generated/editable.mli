[@@@ocaml.text
"Interface for single-line text editing widgets.\n\n\
 Typical examples of editable widgets are [Gtk.Entry] and\n\
 [Gtk.SpinButton]. It contains functions for generically manipulating\n\
 an editable widget, a large number of action signals used for key bindings,\n\
 and several signals that an application can connect to modify the behavior\n\
 of a widget.\n\n\
 As an example of the latter usage, by connecting the following handler to\n\
 [Gtk.Editable::insert-text], an application can convert all entry\n\
 into a widget into uppercase.\n\n\
 {b Forcing entry to uppercase.}\n\n\
 {[\n\
 #include <ctype.h>\n\n\
 void\n\
 insert_text_handler (GtkEditable *editable,\n\
\                     const char  *text,\n\
\                     int          length,\n\
\                     int         *position,\n\
\                     gpointer     data)\n\
 {\n\
\  char *result = g_utf8_strup (text, length);\n\n\
\  g_signal_handlers_block_by_func (editable,\n\
\                               (gpointer) insert_text_handler, data);\n\
\  gtk_editable_insert_text (editable, result, length, position);\n\
\  g_signal_handlers_unblock_by_func (editable,\n\
\                                     (gpointer) insert_text_handler, data);\n\n\
\  g_signal_stop_emission_by_name (editable, \"insert_text\");\n\n\
\  g_free (result);\n\
 }\n\
 ]}\n\n\
 {b Implementing GtkEditable}\n\n\
 The most likely scenario for implementing [GtkEditable] on your own widget\n\
 is that you will embed a [GtkText] inside a complex widget, and want to\n\
 delegate the editable functionality to that text widget. [GtkEditable]\n\
 provides some utility functions to make this easy.\n\n\
 In your class_init function, call [Gtk.Editable.install_properties],\n\
 passing the first available property ID:\n\n\
 {[\n\
 static void\n\
 my_class_init (MyClass *class)\n\
 {\n\
\  ...\n\
\  g_object_class_install_properties (object_class, NUM_PROPERTIES, props);\n\
\  gtk_editable_install_properties (object_clas, NUM_PROPERTIES);\n\
\  ...\n\
 }\n\
 ]}\n\n\
 In your interface_init function for the [GtkEditable] interface, provide\n\
 an implementation for the get_delegate vfunc that returns your text widget:\n\n\
 {[\n\
 GtkEditable *\n\
 get_editable_delegate (GtkEditable *editable)\n\
 {\n\
\  return GTK_EDITABLE (MY_WIDGET (editable)->text_widget);\n\
 }\n\n\
 static void\n\
 my_editable_init (GtkEditableInterface *iface)\n\
 {\n\
\  iface->get_delegate = get_editable_delegate;\n\
 }\n\
 ]}\n\n\
 You don't need to provide any other vfuncs. The default implementations\n\
 work by forwarding to the delegate that the GtkEditableInterface.get_delegate()\n\
 vfunc returns.\n\n\
 In your instance_init function, create your text widget, and then call\n\
 [Gtk.Editable.init_delegate]:\n\n\
 {[\n\
 static void\n\
 my_widget_init (MyWidget *self)\n\
 {\n\
\  ...\n\
\  self->text_widget = gtk_text_new ();\n\
\  gtk_editable_init_delegate (GTK_EDITABLE (self));\n\
\  ...\n\
 }\n\
 ]}\n\n\
 In your dispose function, call [Gtk.Editable.finish_delegate] before\n\
 destroying your text widget:\n\n\
 {[\n\
 static void\n\
 my_widget_dispose (GObject *object)\n\
 {\n\
\  ...\n\
\  gtk_editable_finish_delegate (GTK_EDITABLE (self));\n\
\  g_clear_pointer (&self->text_widget, gtk_widget_unparent);\n\
\  ...\n\
 }\n\
 ]}\n\n\
 Finally, use [Gtk.Editable.delegate_set_property] in your [set_property]\n\
 function (and similar for [get_property]), to set the editable properties:\n\n\
 {[\n\
\  ...\n\
\  if (gtk_editable_delegate_set_property (object, prop_id, value, pspec))\n\
\    return;\n\n\
\  switch (prop_id)\n\
\  ...\n\
 ]}\n\n\
 It is important to note that if you create a [GtkEditable] that uses\n\
 a delegate, the low level [Gtk.Editable::insert-text] and\n\
 [Gtk.Editable::delete-text] signals will be propagated from the\n\
 \"wrapper\" editable to the delegate, but they will not be propagated from\n\
 the delegate to the \"wrapper\" editable, as they would cause an infinite\n\
 recursion. If you wish to connect to the [Gtk.Editable::insert-text]\n\
 and [Gtk.Editable::delete-text] signals, you will need to connect\n\
 to them on the delegate obtained via [Gtk.Editable.get_delegate].\n\n\
 Its methods, signals and properties are on {!class-type-editable_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Editable}."]

(** The methods, signals and properties of a [GtkEditable]. *)
class type editable_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_delete_text :
    ?after:bool ->
    callback:(start_pos:int -> end_pos:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method delegate_get_accessible_platform_state :
    Enums.accessibleplatformstate -> bool

  method delete_selection : unit -> unit
  method delete_text : int -> int -> unit
  method finish_delegate : unit -> unit
  method get_alignment : unit -> float
  method get_chars : int -> int -> string
  method get_delegate : unit -> editable_t option
  method get_editable : unit -> bool
  method get_enable_undo : unit -> bool
  method get_max_width_chars : unit -> int
  method get_position : unit -> int
  method get_text : unit -> string
  method get_width_chars : unit -> int
  method init_delegate : unit -> unit
  method select_region : int -> int -> unit
  method set_alignment : float -> unit
  method set_editable : bool -> unit
  method set_enable_undo : bool -> unit
  method set_max_width_chars : int -> unit
  method set_position : int -> unit
  method set_text : string -> unit
  method set_width_chars : int -> unit
  method selection_bound : int
  method as_editable : Raw.Editable.t
end

class editable : Raw.Editable.t -> editable_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Editable.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkEditable], give one already wrapped. *)
