(* GENERATED CODE - DO NOT EDIT *)
(* Editable: Editable *)

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
 to them on the delegate obtained via [Gtk.Editable.get_delegate]."]

type t = [ `editable ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gtk_editable_from_gobject"

(* Methods *)

external set_width_chars : t -> int -> unit = "ml_gtk_editable_set_width_chars"
(** Changes the size request of the editable to be about the right size for
    [n_chars] characters.

    Note that it changes the size request, the size can still be affected by how
    you pack the widget into containers. If [n_chars] is -1, the size reverts to
    the default size. *)

external set_text : t -> string -> unit = "ml_gtk_editable_set_text"
(** Sets the text in the editable to the given value.

    This is replacing the current contents. *)

external set_position : t -> int -> unit = "ml_gtk_editable_set_position"
(** Sets the cursor position in the editable to the given value.

    The cursor is displayed before the character with the given (base 0) index
    in the contents of the editable. The value must be less than or equal to the
    number of characters in the editable. A value of -1 indicates that the
    position should be set after the last character of the editable. Note that
    [position] is in characters, not in bytes. *)

external set_max_width_chars : t -> int -> unit
  = "ml_gtk_editable_set_max_width_chars"
(** Sets the desired maximum width in characters of [editable]. *)

external set_enable_undo : t -> bool -> unit = "ml_gtk_editable_set_enable_undo"
(** If enabled, changes to [editable] will be saved for undo/redo actions.

    This results in an additional copy of text changes and are not stored in
    secure memory. As such, undo is forcefully disabled when
    [Gtk.Text:visibility] is set to [FALSE]. *)

external set_editable : t -> bool -> unit = "ml_gtk_editable_set_editable"
(** Determines if the user can edit the text in the editable widget. *)

external set_alignment : t -> float -> unit = "ml_gtk_editable_set_alignment"
(** Sets the alignment for the contents of the editable.

    This controls the horizontal positioning of the contents when the displayed
    text is shorter than the width of the editable. *)

external select_region : t -> int -> int -> unit
  = "ml_gtk_editable_select_region"
(** Selects a region of text.

    The characters that are selected are those characters at positions from
    [start_pos] up to, but not including [end_pos]. If [end_pos] is negative,
    then the characters selected are those characters from [start_pos] to the
    end of the text.

    Note that positions are specified in characters, not bytes. *)

external insert_text : t -> string -> int -> int -> unit
  = "ml_gtk_editable_insert_text"
(** Inserts [length] bytes of [text] into the contents of the widget, at
    position [position].

    Note that the position is in characters, not in bytes. The function updates
    [position] to point after the newly inserted text. *)

external init_delegate : t -> unit = "ml_gtk_editable_init_delegate"
(** Sets up a delegate for [GtkEditable].

    This is assuming that the get_delegate vfunc in the [GtkEditable] interface
    has been set up for the [editable]'s type.

    This is a helper function that should be called in instance init, after
    creating the delegate object. *)

external get_width_chars : t -> int = "ml_gtk_editable_get_width_chars"
(** Gets the number of characters of space reserved for the contents of the
    editable. *)

external get_text : t -> string = "ml_gtk_editable_get_text"
(** Retrieves the contents of [editable].

    The returned string is owned by GTK and must not be modified or freed. *)

external get_selection_bounds : t -> bool * int * int
  = "ml_gtk_editable_get_selection_bounds"
(** Retrieves the selection bound of the editable.

    [start_pos] will be filled with the start of the selection and [end_pos]
    with end. If no text was selected both will be identical and [FALSE] will be
    returned.

    Note that positions are specified in characters, not bytes. *)

external get_position : t -> int = "ml_gtk_editable_get_position"
(** Retrieves the current position of the cursor relative to the start of the
    content of the editable.

    Note that this position is in characters, not in bytes. *)

external get_max_width_chars : t -> int = "ml_gtk_editable_get_max_width_chars"
(** Retrieves the desired maximum width of [editable], in characters. *)

external get_enable_undo : t -> bool = "ml_gtk_editable_get_enable_undo"
(** Gets if undo/redo actions are enabled for [editable] *)

external get_editable : t -> bool = "ml_gtk_editable_get_editable"
(** Retrieves whether [editable] is editable. *)

external get_delegate : t -> t option = "ml_gtk_editable_get_delegate"
(** Gets the [GtkEditable] that [editable] is delegating its implementation to.

    Typically, the delegate is a [Gtk.Text] widget. *)

external get_chars : t -> int -> int -> string = "ml_gtk_editable_get_chars"
(** Retrieves a sequence of characters.

    The characters that are retrieved are those characters at positions from
    [start_pos] up to, but not including [end_pos]. If [end_pos] is negative,
    then the characters retrieved are those characters from [start_pos] to the
    end of the text.

    Note that positions are specified in characters, not bytes. *)

external get_alignment : t -> float = "ml_gtk_editable_get_alignment"
(** Gets the alignment of the editable. *)

external finish_delegate : t -> unit = "ml_gtk_editable_finish_delegate"
(** Undoes the setup done by [Gtk.Editable.init_delegate].

    This is a helper function that should be called from dispose, before
    removing the delegate object. *)

external delete_text : t -> int -> int -> unit = "ml_gtk_editable_delete_text"
(** Deletes a sequence of characters.

    The characters that are deleted are those characters at positions from
    [start_pos] up to, but not including [end_pos]. If [end_pos] is negative,
    then the characters deleted are those from [start_pos] to the end of the
    text.

    Note that the positions are specified in characters, not bytes. *)

external delete_selection : t -> unit = "ml_gtk_editable_delete_selection"
(** Deletes the currently selected text of the editable.

    This call doesn’t do anything if there is no selected text. *)

external delegate_get_accessible_platform_state :
  t -> Gtk_enums.accessibleplatformstate -> bool
  = "ml_gtk_editable_delegate_get_accessible_platform_state"
(** Retrieves the accessible platform state from the editable delegate.

    This is an helper function to retrieve the accessible state for
    [GtkEditable] interface implementations using a delegate pattern.

    You should call this function in your editable widget implementation of the
    [Gtk.Accessible.get_platform_state] virtual function, for instance:

    {[
    static void
    accessible_interface_init (GtkAccessibleInterface *iface)
    {
      iface->get_platform_state = your_editable_get_accessible_platform_state;
    }

    static gboolean
    your_editable_get_accessible_platform_state (GtkAccessible *accessible,
                                                 GtkAccessiblePlatformState state)
    {
      return gtk_editable_delegate_get_accessible_platform_state (GTK_EDITABLE (accessible), state);
    }
    ]}

    Note that the widget which is the delegate {i must} be a direct child of
    this widget, otherwise your implementation of
    [Gtk.Accessible.get_platform_state] might not even be called, as the
    platform change will originate from the parent of the delegate, and, as a
    result, will not work properly.

    So, if you can't ensure the direct child condition, you should give the
    delegate the [GTK_ACCESSIBLE_ROLE_TEXT_BOX] role, or you can change your
    tree to allow this function to work. *)

(* Properties *)

external get_selection_bound : t -> int = "ml_gtk_editable_get_selection_bound"
(** Get property: selection-bound *)

val on_changed :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_delete_text :
  ?after:bool ->
  t ->
  callback:(start_pos:int -> end_pos:int -> unit) ->
  Gobject.Signal.handler_id
