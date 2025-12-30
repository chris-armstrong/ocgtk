(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeExpander *)

type t = [`tree_expander | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new TreeExpander *)
external new_ : unit -> t = "ml_gtk_tree_expander_new"

(* Methods *)
(** Sets the tree list row that this expander should manage. *)
external set_list_row : t -> Tree_list_row.t option -> unit = "ml_gtk_tree_expander_set_list_row"

(** Sets if the TreeExpander should indent the child by the width of an expander-icon when it is not expandable. *)
external set_indent_for_icon : t -> bool -> unit = "ml_gtk_tree_expander_set_indent_for_icon"

(** Sets if the TreeExpander should indent the child according to its depth. *)
external set_indent_for_depth : t -> bool -> unit = "ml_gtk_tree_expander_set_indent_for_depth"

(** Sets whether the expander icon should be visible in a GtkTreeListRow. *)
external set_hide_expander : t -> bool -> unit = "ml_gtk_tree_expander_set_hide_expander"

(** Sets the content widget to display. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_tree_expander_set_child"

(** Gets the list row managed by @self. *)
external get_list_row : t -> Tree_list_row.t option = "ml_gtk_tree_expander_get_list_row"

(** TreeExpander indents the child by the width of an expander-icon if it is not expandable. *)
external get_indent_for_icon : t -> bool = "ml_gtk_tree_expander_get_indent_for_icon"

(** TreeExpander indents each level of depth with an additional indent. *)
external get_indent_for_depth : t -> bool = "ml_gtk_tree_expander_get_indent_for_depth"

(** Gets whether the TreeExpander should be hidden in a GtkTreeListRow. *)
external get_hide_expander : t -> bool = "ml_gtk_tree_expander_get_hide_expander"

(** Gets the child widget displayed by @self. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_tree_expander_get_child"

(* Properties *)

