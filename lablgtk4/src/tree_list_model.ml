(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeListModel *)

type t = Gtk.widget

(** Create a new TreeListModel *)
external new_ : unit -> bool -> bool -> unit -> unit -> unit -> t = "ml_gtk_tree_list_model_new_bytecode" "ml_gtk_tree_list_model_new_native"

(* Properties *)

(** Sets whether the model should autoexpand.

If set to %TRUE, the model will recursively expand all rows that
get added to the model. This can be either rows added by changes
to the underlying models or via [method@Gtk.TreeListRow.set_expanded]. *)
external set_autoexpand : t -> bool -> unit = "ml_gtk_tree_list_model_set_autoexpand"

(** Gets the row object for the given row.

If @position is greater than the number of items in @self,
%NULL is returned.

The row object can be used to expand and collapse rows as
well as to inspect its position in the tree. See its
documentation for details.

This row object is persistent and will refer to the current
item as long as the row is present in @self, independent of
other rows being added or removed.

If @self is set to not be passthrough, this function is
equivalent to calling g_list_model_get_item().

Do not confuse this function with [method@Gtk.TreeListModel.get_child_row]. *)
external get_row : t -> int -> Gtk.widget option = "ml_gtk_tree_list_model_get_row"

(** Gets whether the model is passing through original row items.

If this function returns %FALSE, the `GListModel` functions for @self
return custom `GtkTreeListRow` objects. You need to call
[method@Gtk.TreeListRow.get_item] on these objects to get the original
item.

If %TRUE, the values of the child models are passed through in their
original state. You then need to call [method@Gtk.TreeListModel.get_row]
to get the custom `GtkTreeListRow`s. *)
external get_passthrough : t -> bool = "ml_gtk_tree_list_model_get_passthrough"

(** Gets the row item corresponding to the child at index @position for
@self's root model.

If @position is greater than the number of children in the root model,
%NULL is returned.

Do not confuse this function with [method@Gtk.TreeListModel.get_row]. *)
external get_child_row : t -> int -> Gtk.widget option = "ml_gtk_tree_list_model_get_child_row"

(** Gets whether the model is set to automatically expand new rows
that get added.

This can be either rows added by changes to the underlying
models or via [method@Gtk.TreeListRow.set_expanded]. *)
external get_autoexpand : t -> bool = "ml_gtk_tree_list_model_get_autoexpand"

