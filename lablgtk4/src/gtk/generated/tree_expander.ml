(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeExpander *)

type t = [`tree_expander | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new TreeExpander *)
external new_ : unit -> t = "ml_gtk_tree_expander_new"

(* Properties *)

(** Get property: hide-expander *)
external get_hide_expander : t -> bool = "ml_gtk_tree_expander_get_hide_expander"

(** Set property: hide-expander *)
external set_hide_expander : t -> bool -> unit = "ml_gtk_tree_expander_set_hide_expander"

(** Get property: indent-for-depth *)
external get_indent_for_depth : t -> bool = "ml_gtk_tree_expander_get_indent_for_depth"

(** Set property: indent-for-depth *)
external set_indent_for_depth : t -> bool -> unit = "ml_gtk_tree_expander_set_indent_for_depth"

(** Get property: indent-for-icon *)
external get_indent_for_icon : t -> bool = "ml_gtk_tree_expander_get_indent_for_icon"

(** Set property: indent-for-icon *)
external set_indent_for_icon : t -> bool -> unit = "ml_gtk_tree_expander_set_indent_for_icon"

(** Sets the tree list row that this expander should manage. *)
external set_list_row : t -> Tree_list_row.t option -> unit = "ml_gtk_tree_expander_set_list_row"

(** Sets the content widget to display. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_tree_expander_set_child"

(** Gets the list row managed by @self. *)
external get_list_row : t -> Tree_list_row.t option = "ml_gtk_tree_expander_get_list_row"

(** Gets the child widget displayed by @self. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_tree_expander_get_child"

