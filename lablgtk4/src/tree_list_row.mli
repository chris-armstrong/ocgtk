(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeListRow *)

type t = Gtk.widget

(* Properties *)

(** Get property: depth *)
external get_depth : t -> int = "ml_gtk_tree_list_row_get_depth"

(** Get property: expandable *)
external get_expandable : t -> bool = "ml_gtk_tree_list_row_get_expandable"

(** Get property: expanded *)
external get_expanded : t -> bool = "ml_gtk_tree_list_row_get_expanded"

(** Set property: expanded *)
external set_expanded : t -> bool -> unit = "ml_gtk_tree_list_row_set_expanded"

external is_expandable : t -> bool = "ml_gtk_tree_list_row_is_expandable"

external get_position : t -> int = "ml_gtk_tree_list_row_get_position"

external get_parent : t -> Gtk.widget = "ml_gtk_tree_list_row_get_parent"

external get_child_row : t -> int -> Gtk.widget = "ml_gtk_tree_list_row_get_child_row"

