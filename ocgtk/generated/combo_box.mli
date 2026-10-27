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

    Its methods, signals and properties are on {!class-type-combo_box_t}. The
    functions it is built on are in {!Ocgtk.Raw.Combo_box}. *)

(** The methods, signals and properties of a [GtkComboBox]. *)
class type combo_box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Cell_editable.cell_editable_t
  inherit Cell_area_and__cell_area_context_and__cell_layout.cell_layout_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_format_entry_text :
    ?after:bool ->
    callback:(path:string -> string) ->
    unit ->
    Gobject.Signal.handler_id

  method on_move_active :
    ?after:bool ->
    callback:(scroll_type:Enums.scrolltype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_popdown :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_popup :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_active : unit -> int
  method get_active_id : unit -> string option
  method get_button_sensitivity : unit -> Enums.sensitivitytype

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_entry_text_column : unit -> int
  method get_has_entry : unit -> bool
  method get_id_column : unit -> int
  method get_model : unit -> Tree_model.tree_model_t option
  method get_popup_fixed_width : unit -> bool
  method popdown : unit -> unit
  method popup : unit -> unit
  method popup_for_device : Ocgdk.Device.device_t -> unit
  method set_active : int -> unit
  method set_active_id : string option -> bool
  method set_active_iter : Raw.Tree_iter.t option -> unit
  method set_button_sensitivity : Enums.sensitivitytype -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_entry_text_column : int -> unit
  method set_id_column : int -> unit
  method set_model : Tree_model.tree_model_t option -> unit
  method set_popup_fixed_width : bool -> unit
  method has_frame : bool
  method set_has_frame : bool -> unit
  method popup_shown : bool
  method as_combo_box : Raw.Combo_box.t
end

class combo_box : Raw.Combo_box.t -> combo_box_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Combo_box.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkComboBox], give one already wrapped. *)

val new_ : unit -> combo_box_t
val new_with_entry : unit -> combo_box_t
val new_with_model : Tree_model.tree_model_t -> combo_box_t
val new_with_model_and_entry : Tree_model.tree_model_t -> combo_box_t
