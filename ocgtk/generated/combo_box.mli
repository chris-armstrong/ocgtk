(** A [GtkComboBox] is a widget that allows the user to choose from a list of
    valid choices.

    An example GtkComboBox

    The [GtkComboBox] displays the selected choice; when activated, the
    [GtkComboBox] displays a popup which allows the user to make a new choice.

    The [GtkComboBox] uses the model-view pattern; the list of valid choices is
    specified in the form of a tree model, and the display of the choices can be
    adapted to the data in the model by using cell renderers, as you would in a
    tree view. This is possible since [GtkComboBox] implements the
    [Gtk.CellLayout] interface. The tree model holding the valid choices is not
    restricted to a flat list, it can be a real tree, and the popup will reflect
    the tree structure.

    To allow the user to enter values not in the model, the
    [Gtk.ComboBox:has-entry] property allows the [GtkComboBox] to contain a
    [Gtk.Entry]. This entry can be accessed by calling [Gtk.ComboBox.get_child]
    on the combo box.

    For a simple list of textual choices, the model-view API of [GtkComboBox]
    can be a bit overwhelming. In this case, [Gtk.ComboBoxText] offers a simple
    alternative. Both [GtkComboBox] and [GtkComboBoxText] can contain an entry.

    {b CSS nodes}

    {[
    combobox
    ├── box.linked
    │   ╰── button.combo
    │       ╰── box
    │           ├── cellview
    │           ╰── arrow
    ╰── window.popup
    ]}

    A normal combobox contains a box with the .linked class, a button with the
    .combo class and inside those buttons, there are a cellview and an arrow.

    {[
    combobox
    ├── box.linked
    │   ├── entry.combo
    │   ╰── button.combo
    │       ╰── box
    │           ╰── arrow
    ╰── window.popup
    ]}

    A [GtkComboBox] with an entry has a single CSS node with name combobox. It
    contains a box with the .linked class. That box contains an entry and a
    button, both with the .combo class added. The button also contains another
    node with name arrow.

    {b Accessibility}

    [GtkComboBox] uses the [Gtk.AccessibleRole.combo_box] role.

    Its methods, signals and properties are on {!class-type-combo_box_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Combo_box}. *)

(** The methods, signals and properties of a [ComboBox]. *)
class type combo_box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Cell_editable.cell_editable_t
  inherit Cell_area_and__cell_area_context_and__cell_layout.cell_layout_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to when the combo box is activated.

      The [::activate] signal on [GtkComboBox] is an action signal and emitting
      it causes the combo box to pop up its dropdown. *)

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the active item is changed.

      The can be due to the user selecting a different item from the list, or
      due to a call to [Gtk.ComboBox.set_active_iter]. It will also be emitted
      while typing into the entry of a combo box with an entry. *)

  method on_format_entry_text :
    ?after:bool ->
    callback:(path:string -> string) ->
    unit ->
    Gobject.Signal.handler_id
  [@@ocaml.doc
    "Emitted to allow changing how the text in a combo box's entry is \
     displayed.\n\n\
     See [Gtk.ComboBox:has-entry].\n\n\
     Connect a signal handler which returns an allocated string representing\n\
     [path]. That string will then be used to set the text in the combo box's\n\
     entry. The default signal handler uses the text from the\n\
     [Gtk.ComboBox:entry-text-column] model column.\n\n\
     Here's an example signal handler which fetches data from the model and\n\
     displays it in the entry.\n\n\
     {[\n\
     static char *\n\
     format_entry_text_callback (GtkComboBox *combo,\n\
    \                            const char *path,\n\
    \                            gpointer     user_data)\n\
     {\n\
    \  GtkTreeIter iter;\n\
    \  GtkTreeModel model;\n\
    \  double       value;\n\n\
    \  model = gtk_combo_box_get_model (combo);\n\n\
    \  gtk_tree_model_get_iter_from_string (model, &iter, path);\n\
    \  gtk_tree_model_get (model, &iter,\n\
    \                      THE_DOUBLE_VALUE_COLUMN, &value,\n\
    \                      -1);\n\n\
    \  return g_strdup_printf (\"%g\", value);\n\
     }\n\
     ]}"]

  method on_move_active :
    ?after:bool ->
    callback:(scroll_type:Enums.scrolltype -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted to move the active selection.

      This is an keybinding signal. *)

  method on_popdown :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id
  (** Emitted to popdown the combo box list.

      This is an keybinding signal.

      The default bindings for this signal are Alt+Up and Escape. *)

  method on_popup :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to popup the combo box list.

      This is an keybinding signal.

      The default binding for this signal is Alt+Down. *)

  method get_active : unit -> int
  (** Returns the index of the currently active item.

      If the model is a non-flat treemodel, and the active item is not an
      immediate child of the root of the tree, this function returns
      gtk_tree_path_get_indices (path)\[0\], where [path] is the [Gtk.TreePath]
      of the active item. *)

  method get_active_id : unit -> string option
  (** Returns the ID of the active row of [combo_box].

      This value is taken from the active row and the column specified by the
      [Gtk.ComboBox:id-column] property of [combo_box] (see
      [Gtk.ComboBox.set_id_column]).

      The returned value is an interned string which means that you can compare
      the pointer by value to other interned strings and that you must not free
      it.

      If the [Gtk.ComboBox:id-column] property of [combo_box] is not set, or if
      no row is active, or if the active row has a [NULL] ID value, then [NULL]
      is returned. *)

  method get_button_sensitivity : unit -> Enums.sensitivitytype
  (** Returns whether the combo box sets the dropdown button sensitive or not
      when there are no items in the model. *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child widget of [combo_box]. *)

  method get_entry_text_column : unit -> int
  (** Returns the column which [combo_box] is using to get the strings from to
      display in the internal entry. *)

  method get_has_entry : unit -> bool
  (** Returns whether the combo box has an entry. *)

  method get_id_column : unit -> int
  (** Returns the column which [combo_box] is using to get string IDs for values
      from. *)

  method get_model : unit -> Tree_model.tree_model_t option
  (** Returns the [GtkTreeModel] of [combo_box]. *)

  method get_popup_fixed_width : unit -> bool
  (** Gets whether the popup uses a fixed width. *)

  method popdown : unit -> unit
  (** Hides the menu or dropdown list of [combo_box].

      This function is mostly intended for use by accessibility technologies;
      applications should have little use for it. *)

  method popup : unit -> unit
  (** Pops up the menu or dropdown list of [combo_box].

      This function is mostly intended for use by accessibility technologies;
      applications should have little use for it.

      Before calling this, [combo_box] must be mapped, or nothing will happen.
  *)

  method popup_for_device : Ocgdk.Device.device_t -> unit
  (** Pops up the menu of [combo_box].

      Note that currently this does not do anything with the device, as it was
      previously only used for list-mode combo boxes, and those were removed in
      GTK 4. However, it is retained in case similar functionality is added back
      later. *)

  method set_active : int -> unit
  (** Sets the active item of [combo_box] to be the item at [index]. *)

  method set_active_id : string option -> bool
  (** Changes the active row of [combo_box] to the one that has an ID equal to
      [active_id].

      If [active_id] is [NULL], the active row is unset. Rows having a [NULL] ID
      string cannot be made active by this function.

      If the [Gtk.ComboBox:id-column] property of [combo_box] is unset or if no
      row has the given ID then the function does nothing and returns [FALSE].
  *)

  method set_active_iter : Raw.Tree_iter.t option -> unit
  (** Sets the current active item to be the one referenced by [iter].

      If [iter] is [NULL], the active item is unset. *)

  method set_button_sensitivity : Enums.sensitivitytype -> unit
  (** Sets whether the dropdown button of the combo box should update its
      sensitivity depending on the model contents. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child widget of [combo_box]. *)

  method set_entry_text_column : int -> unit
  (** Sets the model column which [combo_box] should use to get strings from to
      be [text_column].

      For this column no separate [Gtk.CellRenderer] is needed.

      The column [text_column] in the model of [combo_box] must be of type
      [G_TYPE_STRING].

      This is only relevant if [combo_box] has been created with
      [Gtk.ComboBox:has-entry] as [TRUE]. *)

  method set_id_column : int -> unit
  (** Sets the model column which [combo_box] should use to get string IDs for
      values from.

      The column [id_column] in the model of [combo_box] must be of type
      [G_TYPE_STRING]. *)

  method set_model : Tree_model.tree_model_t option -> unit
  (** Sets the model used by [combo_box] to be [model].

      Will unset a previously set model (if applicable). If model is [NULL],
      then it will unset the model.

      Note that this function does not clear the cell renderers, you have to
      call [Gtk.CellLayout.clear] yourself if you need to set up different cell
      renderers for the new model. *)

  method set_popup_fixed_width : bool -> unit
  (** Specifies whether the popup’s width should be a fixed width.

      If [fixed] is [TRUE], the popup's width is set to match the allocated
      width of the combo box. *)

  method has_frame : bool
  method set_has_frame : bool -> unit
  method popup_shown : bool
  method as_combo_box : Raw.Combo_box.t
end

class combo_box : Raw.Combo_box.t -> combo_box_t
(** Wraps a raw handle of {!Ocgtk.Raw.Combo_box.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> combo_box_t
(** Creates a new empty [GtkComboBox]. *)

val new_with_entry : unit -> combo_box_t
(** Creates a new empty [GtkComboBox] with an entry.

    In order to use a combo box with entry, you need to tell it which column of
    the model contains the text for the entry by calling
    [Gtk.ComboBox.set_entry_text_column]. *)

val new_with_model : Tree_model.tree_model_t -> combo_box_t
(** Creates a new [GtkComboBox] with a model. *)

val new_with_model_and_entry : Tree_model.tree_model_t -> combo_box_t
(** Creates a new empty [GtkComboBox] with an entry and a model.

    See also [Gtk.ComboBox.new_with_entry]. *)
