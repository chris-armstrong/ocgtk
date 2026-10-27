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
  (** The [has-frame] property controls whether a frame is drawn around the
      entry. *)

  method set_has_frame : bool -> unit
  (** The [has-frame] property controls whether a frame is drawn around the
      entry. *)

  method popup_shown : bool
  (** Whether the combo boxes dropdown is popped up.

      Note that this property is mainly useful, because it allows you to connect
      to notify::popup-shown. *)

  method as_combo_box : Raw.Combo_box.t
end

(* High-level class for ComboBox *)
class combo_box (obj : Raw.Combo_box.t) : combo_box_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Cell_editable.cell_editable (Raw.Cell_editable.from_gobject obj)

    inherit
      Cell_area_and__cell_area_context_and__cell_layout.cell_layout
        (Raw.Cell_layout.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Combo_box.on_activate ~after self#as_combo_box ~callback

    method on_changed ?(after = false) ~callback () =
      Raw.Combo_box.on_changed ~after self#as_combo_box ~callback

    method on_format_entry_text ?(after = false) ~callback () =
      Raw.Combo_box.on_format_entry_text ~after self#as_combo_box ~callback

    method on_move_active ?(after = false) ~callback () =
      Raw.Combo_box.on_move_active ~after self#as_combo_box ~callback

    method on_popdown ?(after = false) ~callback () =
      Raw.Combo_box.on_popdown ~after self#as_combo_box ~callback

    method on_popup ?(after = false) ~callback () =
      Raw.Combo_box.on_popup ~after self#as_combo_box ~callback

    method get_active : unit -> int = fun () -> Raw.Combo_box.get_active obj

    method get_active_id : unit -> string option =
      fun () -> Raw.Combo_box.get_active_id obj

    method get_button_sensitivity : unit -> Enums.sensitivitytype =
      fun () -> Raw.Combo_box.get_button_sensitivity obj

    method get_child :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Combo_box.get_child obj)

    method get_entry_text_column : unit -> int =
      fun () -> Raw.Combo_box.get_entry_text_column obj

    method get_has_entry : unit -> bool =
      fun () -> Raw.Combo_box.get_has_entry obj

    method get_id_column : unit -> int =
      fun () -> Raw.Combo_box.get_id_column obj

    method get_model : unit -> Tree_model.tree_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Tree_model.tree_model ret)
          (Raw.Combo_box.get_model obj)

    method get_popup_fixed_width : unit -> bool =
      fun () -> Raw.Combo_box.get_popup_fixed_width obj

    method popdown : unit -> unit = fun () -> Raw.Combo_box.popdown obj
    method popup : unit -> unit = fun () -> Raw.Combo_box.popup obj

    method popup_for_device : Ocgdk.Device.device_t -> unit =
      fun device ->
        let device = device#as_device in
        Raw.Combo_box.popup_for_device obj device

    method set_active : int -> unit =
      fun index_ -> Raw.Combo_box.set_active obj index_

    method set_active_id : string option -> bool =
      fun active_id -> Raw.Combo_box.set_active_id obj active_id

    method set_active_iter : Raw.Tree_iter.t option -> unit =
      fun iter -> Raw.Combo_box.set_active_iter obj iter

    method set_button_sensitivity : Enums.sensitivitytype -> unit =
      fun sensitivity -> Raw.Combo_box.set_button_sensitivity obj sensitivity

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Combo_box.set_child obj child

    method set_entry_text_column : int -> unit =
      fun text_column -> Raw.Combo_box.set_entry_text_column obj text_column

    method set_id_column : int -> unit =
      fun id_column -> Raw.Combo_box.set_id_column obj id_column

    method set_model : Tree_model.tree_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_tree_model) model in
        Raw.Combo_box.set_model obj model

    method set_popup_fixed_width : bool -> unit =
      fun fixed -> Raw.Combo_box.set_popup_fixed_width obj fixed

    method has_frame = Raw.Combo_box.get_has_frame obj
    method set_has_frame v = Raw.Combo_box.set_has_frame obj v
    method popup_shown = Raw.Combo_box.get_popup_shown obj
    method as_combo_box = obj
  end

let new_ () : combo_box_t = new combo_box (Raw.Combo_box.new_ ())

let new_with_entry () : combo_box_t =
  new combo_box (Raw.Combo_box.new_with_entry ())

let new_with_model (model : Tree_model.tree_model_t) : combo_box_t =
  let model = model#as_tree_model in
  let obj_ = Raw.Combo_box.new_with_model model in
  new combo_box obj_

let new_with_model_and_entry (model : Tree_model.tree_model_t) : combo_box_t =
  let model = model#as_tree_model in
  let obj_ = Raw.Combo_box.new_with_model_and_entry model in
  new combo_box obj_
