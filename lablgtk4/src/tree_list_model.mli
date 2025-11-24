(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeListModel *)

type t = Gtk.widget

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

external get_row : t -> int -> Gtk.widget = "ml_gtk_tree_list_model_get_row"

external get_child_row : t -> int -> Gtk.widget = "ml_gtk_tree_list_model_get_child_row"

