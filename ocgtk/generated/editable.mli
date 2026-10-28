(** Interface for single-line text editing widgets.

    Its methods, signals and properties are on {!class-type-editable_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Editable}. *)

(** {1:class Class} *)

class type editable_t = object
  (** {2:signals Signals} *)

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted at the end of a single user-visible operation on the contents.

      E.g., a paste operation that replaces the contents of the selection will
      cause only one signal emission (even though it is implemented by first
      deleting the selection, then inserting the new content, and may cause
      multiple ::notify::text signals to be emitted). *)

  method on_delete_text :
    ?after:bool ->
    callback:(start_pos:int -> end_pos:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when text is deleted from the widget by the user.

      The default handler for this signal will normally be responsible for
      deleting the text, so by connecting to this signal and then stopping the
      signal with g_signal_stop_emission(), it is possible to modify the range
      of deleted text, or prevent it from being deleted entirely.

      The [start_pos] and [end_pos] parameters are interpreted as for
      [Gtk.Editable.delete_text]. *)

  (** {2:methods Methods} *)

  method delegate_get_accessible_platform_state :
    Enums.accessibleplatformstate -> bool
  (** Retrieves the accessible platform state from the editable delegate.

      This is an helper function to retrieve the accessible state for
      [GtkEditable] interface implementations using a delegate pattern.

      You should call this function in your editable widget implementation of
      the [Gtk.Accessible.get_platform_state] virtual function, for instance:

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

  method delete_selection : unit -> unit
  (** Deletes the currently selected text of the editable.

      This call doesn’t do anything if there is no selected text. *)

  method delete_text : int -> int -> unit
  (** Deletes a sequence of characters.

      The characters that are deleted are those characters at positions from
      [start_pos] up to, but not including [end_pos]. If [end_pos] is negative,
      then the characters deleted are those from [start_pos] to the end of the
      text.

      Note that the positions are specified in characters, not bytes. *)

  method finish_delegate : unit -> unit
  (** Undoes the setup done by [Gtk.Editable.init_delegate].

      This is a helper function that should be called from dispose, before
      removing the delegate object. *)

  method get_alignment : unit -> float
  (** Gets the alignment of the editable. *)

  method get_chars : int -> int -> string
  (** Retrieves a sequence of characters.

      The characters that are retrieved are those characters at positions from
      [start_pos] up to, but not including [end_pos]. If [end_pos] is negative,
      then the characters retrieved are those characters from [start_pos] to the
      end of the text.

      Note that positions are specified in characters, not bytes. *)

  method get_delegate : unit -> editable_t option
  (** Gets the [GtkEditable] that [editable] is delegating its implementation
      to.

      Typically, the delegate is a [Gtk.Text] widget. *)

  method get_editable : unit -> bool
  (** Retrieves whether [editable] is editable. *)

  method get_enable_undo : unit -> bool
  (** Gets if undo/redo actions are enabled for [editable] *)

  method get_max_width_chars : unit -> int
  (** Retrieves the desired maximum width of [editable], in characters. *)

  method get_position : unit -> int
  (** Retrieves the current position of the cursor relative to the start of the
      content of the editable.

      Note that this position is in characters, not in bytes. *)

  method get_text : unit -> string
  (** Retrieves the contents of [editable].

      The returned string is owned by GTK and must not be modified or freed. *)

  method get_width_chars : unit -> int
  (** Gets the number of characters of space reserved for the contents of the
      editable. *)

  method init_delegate : unit -> unit
  (** Sets up a delegate for [GtkEditable].

      This is assuming that the get_delegate vfunc in the [GtkEditable]
      interface has been set up for the [editable]'s type.

      This is a helper function that should be called in instance init, after
      creating the delegate object. *)

  method select_region : int -> int -> unit
  (** Selects a region of text.

      The characters that are selected are those characters at positions from
      [start_pos] up to, but not including [end_pos]. If [end_pos] is negative,
      then the characters selected are those characters from [start_pos] to the
      end of the text.

      Note that positions are specified in characters, not bytes. *)

  method set_alignment : float -> unit
  (** Sets the alignment for the contents of the editable.

      This controls the horizontal positioning of the contents when the
      displayed text is shorter than the width of the editable. *)

  method set_editable : bool -> unit
  (** Determines if the user can edit the text in the editable widget. *)

  method set_enable_undo : bool -> unit
  (** If enabled, changes to [editable] will be saved for undo/redo actions.

      This results in an additional copy of text changes and are not stored in
      secure memory. As such, undo is forcefully disabled when
      [Gtk.Text:visibility] is set to [false]. *)

  method set_max_width_chars : int -> unit
  (** Sets the desired maximum width in characters of [editable]. *)

  method set_position : int -> unit
  (** Sets the cursor position in the editable to the given value.

      The cursor is displayed before the character with the given (base 0) index
      in the contents of the editable. The value must be less than or equal to
      the number of characters in the editable. A value of -1 indicates that the
      position should be set after the last character of the editable. Note that
      [position] is in characters, not in bytes. *)

  method set_text : string -> unit
  (** Sets the text in the editable to the given value.

      This is replacing the current contents. *)

  method set_width_chars : int -> unit
  (** Changes the size request of the editable to be about the right size for
      [n_chars] characters.

      Note that it changes the size request, the size can still be affected by
      how you pack the widget into containers. If [n_chars] is -1, the size
      reverts to the default size. *)

  (** {2:properties Properties} *)

  method selection_bound : int
  (** The position of the opposite end of the selection from the cursor in
      chars. *)

  (** {2:conversions Conversions} *)

  method as_editable : Raw.Editable.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [Editable].}\n\n\
     Requires:\n\
     - {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}\n\n\
     Interface for single-line text editing widgets.\n\n\
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
    \                                     (gpointer) insert_text_handler, \
     data);\n\n\
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
     an implementation for the get_delegate vfunc that returns your text \
     widget:\n\n\
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
     work by forwarding to the delegate that the \
     GtkEditableInterface.get_delegate()\n\
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
     function (and similar for [get_property]), to set the editable \
     properties:\n\n\
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

class editable : Raw.Editable.t -> editable_t
(** Wraps a raw handle of {!Ocgtk.Raw.Editable.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Interface for single-line text editing widgets.\n\n\
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

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
