(* GENERATED CODE - DO NOT EDIT *)
(* TreeListModel: TreeListModel *)

type t = [`tree_list_model | `object_] Gobject.obj

(** Create a new TreeListModel *)
external new_ : unit -> bool -> bool -> unit -> unit -> unit -> t = "ml_gtk_tree_list_model_new_bytecode" "ml_gtk_tree_list_model_new_native"

(* Properties *)

(** Get property: autoexpand *)
external get_autoexpand : t -> bool = "ml_gtk_tree_list_model_get_autoexpand"

(** Set property: autoexpand *)
external set_autoexpand : t -> bool -> unit = "ml_gtk_tree_list_model_set_autoexpand"

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_tree_list_model_get_n_items"

(** Get property: passthrough *)
external get_passthrough : t -> bool = "ml_gtk_tree_list_model_get_passthrough"

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
external get_row : t -> int -> Tree_list_row.t option = "ml_gtk_tree_list_model_get_row"

(** Gets the row item corresponding to the child at index @position for
@self's root model.

If @position is greater than the number of children in the root model,
%NULL is returned.

Do not confuse this function with [method@Gtk.TreeListModel.get_row]. *)
external get_child_row : t -> int -> Tree_list_row.t option = "ml_gtk_tree_list_model_get_child_row"

