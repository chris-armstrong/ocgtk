(* GENERATED CODE - DO NOT EDIT *)
(* TreeListRow: TreeListRow *)

type t = [`tree_list_row | `object_] Gobject.obj

(* Methods *)
(** Expands or collapses a row.

If a row is expanded, the model of calling the
[callback@Gtk.TreeListModelCreateModelFunc] for the row's
item will be inserted after this row. If a row is collapsed,
those items will be removed from the model.

If the row is not expandable, this function does nothing. *)
external set_expanded : t -> bool -> unit = "ml_gtk_tree_list_row_set_expanded"

(** Checks if a row can be expanded.

This does not mean that the row is actually expanded,
this can be checked with [method@Gtk.TreeListRow.get_expanded].

If a row is expandable never changes until the row is removed
from its model at which point it will forever return %FALSE. *)
external is_expandable : t -> bool = "ml_gtk_tree_list_row_is_expandable"

(** Returns the position in the `GtkTreeListModel` that @self occupies
at the moment. *)
external get_position : t -> int = "ml_gtk_tree_list_row_get_position"

(** Gets the row representing the parent for @self.

That is the row that would need to be collapsed
to make this row disappear.

If @self is a row corresponding to the root model,
%NULL is returned.

The value returned by this function never changes
until the row is removed from its model at which point
it will forever return %NULL. *)
external get_parent : t -> t option = "ml_gtk_tree_list_row_get_parent"

(** Gets if a row is currently expanded. *)
external get_expanded : t -> bool = "ml_gtk_tree_list_row_get_expanded"

(** Gets the depth of this row.

Rows that correspond to items in the root model have a depth
of zero, rows corresponding to items of models of direct children
of the root model have a depth of 1 and so on.

The depth of a row never changes until the row is removed from its model
at which point it will forever return 0. *)
external get_depth : t -> int = "ml_gtk_tree_list_row_get_depth"

(** If @self is not expanded or @position is greater than the
number of children, %NULL is returned. *)
external get_child_row : t -> int -> t option = "ml_gtk_tree_list_row_get_child_row"

(* Properties *)

(** Get property: expandable *)
external get_expandable : t -> bool = "ml_gtk_tree_list_row_get_expandable"

