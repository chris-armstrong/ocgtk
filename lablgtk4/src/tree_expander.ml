(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeExpander *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_tree_expander_new"

(* Properties *)

external get_hide_expander : t -> bool = "ml_gtk_tree_expander_get_hide_expander"

external set_hide_expander : t -> bool -> unit = "ml_gtk_tree_expander_set_hide_expander"

external get_indent_for_depth : t -> bool = "ml_gtk_tree_expander_get_indent_for_depth"

external set_indent_for_depth : t -> bool -> unit = "ml_gtk_tree_expander_set_indent_for_depth"

external get_indent_for_icon : t -> bool = "ml_gtk_tree_expander_get_indent_for_icon"

external set_indent_for_icon : t -> bool -> unit = "ml_gtk_tree_expander_set_indent_for_icon"

external set_list_row : t -> Gtk.Widget.t option -> unit = "ml_gtk_tree_expander_set_list_row"

external set_child : t -> Gtk.Widget.t option -> unit = "ml_gtk_tree_expander_set_child"

external get_list_row : t -> Gtk.Widget.t = "ml_gtk_tree_expander_get_list_row"

external get_child : t -> Gtk.Widget.t = "ml_gtk_tree_expander_get_child"

