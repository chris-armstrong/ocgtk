(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ComboBox *)

type t = [`combo_box | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new ComboBox *)
external new_ : unit -> t = "ml_gtk_combo_box_new"

(** Create a new ComboBox *)
external new_with_entry : unit -> t = "ml_gtk_combo_box_new_with_entry"

(** Create a new ComboBox *)
external new_with_model : Gtk.widget -> t = "ml_gtk_combo_box_new_with_model"

(** Create a new ComboBox *)
external new_with_model_and_entry : Gtk.widget -> t = "ml_gtk_combo_box_new_with_model_and_entry"

(* Properties *)

(** Specifies whether the popup’s width should be a fixed width.

If @fixed is %TRUE, the popup's width is set to match the
allocated width of the combo box. *)
external set_popup_fixed_width : t -> bool -> unit = "ml_gtk_combo_box_set_popup_fixed_width"

(** Sets the model used by @combo_box to be @model.

Will unset a previously set model (if applicable). If model is %NULL,
then it will unset the model.

Note that this function does not clear the cell renderers, you have to
call [method@Gtk.CellLayout.clear] yourself if you need to set up different
cell renderers for the new model. *)
external set_model : t -> Gtk.widget option -> unit = "ml_gtk_combo_box_set_model"

(** Sets the model column which @combo_box should use to get string IDs
for values from.

The column @id_column in the model of @combo_box must be of type
%G_TYPE_STRING. *)
external set_id_column : t -> int -> unit = "ml_gtk_combo_box_set_id_column"

(** Sets the model column which @combo_box should use to get strings
from to be @text_column.

For this column no separate
[class@Gtk.CellRenderer] is needed.

The column @text_column in the model of @combo_box must be of
type %G_TYPE_STRING.

This is only relevant if @combo_box has been created with
[property@Gtk.ComboBox:has-entry] as %TRUE. *)
external set_entry_text_column : t -> int -> unit = "ml_gtk_combo_box_set_entry_text_column"

(** Sets the child widget of @combo_box. *)
external set_child : t -> Gtk.widget option -> unit = "ml_gtk_combo_box_set_child"

(** Sets whether the dropdown button of the combo box should update
its sensitivity depending on the model contents. *)
external set_button_sensitivity : t -> Gtk_enums.sensitivitytype -> unit = "ml_gtk_combo_box_set_button_sensitivity"

(** Sets the current active item to be the one referenced by @iter.

If @iter is %NULL, the active item is unset. *)
external set_active_iter : t -> Gtk.widget option -> unit = "ml_gtk_combo_box_set_active_iter"

(** Changes the active row of @combo_box to the one that has an ID equal to
@active_id.

If @active_id is %NULL, the active row is unset. Rows having
a %NULL ID string cannot be made active by this function.

If the [property@Gtk.ComboBox:id-column] property of @combo_box is
unset or if no row has the given ID then the function does nothing
and returns %FALSE. *)
external set_active_id : t -> string option -> bool = "ml_gtk_combo_box_set_active_id"

(** Sets the active item of @combo_box to be the item at @index. *)
external set_active : t -> int -> unit = "ml_gtk_combo_box_set_active"

(** Pops up the menu or dropdown list of @combo_box.

This function is mostly intended for use by accessibility technologies;
applications should have little use for it.

Before calling this, @combo_box must be mapped, or nothing will happen. *)
external popup : t -> unit = "ml_gtk_combo_box_popup"

(** Hides the menu or dropdown list of @combo_box.

This function is mostly intended for use by accessibility technologies;
applications should have little use for it. *)
external popdown : t -> unit = "ml_gtk_combo_box_popdown"

(** Gets whether the popup uses a fixed width. *)
external get_popup_fixed_width : t -> bool = "ml_gtk_combo_box_get_popup_fixed_width"

(** Returns the `GtkTreeModel` of @combo_box. *)
external get_model : t -> Gtk.widget option = "ml_gtk_combo_box_get_model"

(** Returns the column which @combo_box is using to get string IDs
for values from. *)
external get_id_column : t -> int = "ml_gtk_combo_box_get_id_column"

(** Returns whether the combo box has an entry. *)
external get_has_entry : t -> bool = "ml_gtk_combo_box_get_has_entry"

(** Returns the column which @combo_box is using to get the strings
from to display in the internal entry. *)
external get_entry_text_column : t -> int = "ml_gtk_combo_box_get_entry_text_column"

(** Gets the child widget of @combo_box. *)
external get_child : t -> Gtk.widget option = "ml_gtk_combo_box_get_child"

(** Returns whether the combo box sets the dropdown button
sensitive or not when there are no items in the model. *)
external get_button_sensitivity : t -> Gtk_enums.sensitivitytype = "ml_gtk_combo_box_get_button_sensitivity"

(** Sets @iter to point to the currently active item.

If no item is active, @iter is left unchanged. *)
external get_active_iter : t -> bool * unit = "ml_gtk_combo_box_get_active_iter"

(** Returns the ID of the active row of @combo_box.

This value is taken from the active row and the column specified
by the [property@Gtk.ComboBox:id-column] property of @combo_box
(see [method@Gtk.ComboBox.set_id_column]).

The returned value is an interned string which means that you can
compare the pointer by value to other interned strings and that you
must not free it.

If the [property@Gtk.ComboBox:id-column] property of @combo_box is
not set, or if no row is active, or if the active row has a %NULL
ID value, then %NULL is returned. *)
external get_active_id : t -> string option = "ml_gtk_combo_box_get_active_id"

(** Returns the index of the currently active item.

If the model is a non-flat treemodel, and the active item is not
an immediate child of the root of the tree, this function returns
`gtk_tree_path_get_indices (path)[0]`, where `path` is the
[struct@Gtk.TreePath] of the active item. *)
external get_active : t -> int = "ml_gtk_combo_box_get_active"

