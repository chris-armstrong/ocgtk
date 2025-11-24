(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeStore *)

type t = Gtk.widget

(** Create a new TreeStore *)
external new_ : int -> unit -> t = "ml_gtk_tree_store_new"

(** Create a new TreeStore *)
external newv : int -> unit -> t = "ml_gtk_tree_store_newv"

external swap : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_tree_store_swap"

external remove : t -> Gtk.widget -> bool = "ml_gtk_tree_store_remove"

external prepend : t -> Gtk.widget -> Gtk.widget option -> unit = "ml_gtk_tree_store_prepend"

external move_before : t -> Gtk.widget -> Gtk.widget option -> unit = "ml_gtk_tree_store_move_before"

external move_after : t -> Gtk.widget -> Gtk.widget option -> unit = "ml_gtk_tree_store_move_after"

external iter_is_valid : t -> Gtk.widget -> bool = "ml_gtk_tree_store_iter_is_valid"

external iter_depth : t -> Gtk.widget -> int = "ml_gtk_tree_store_iter_depth"

external is_ancestor : t -> Gtk.widget -> Gtk.widget -> bool = "ml_gtk_tree_store_is_ancestor"

external insert_before : t -> Gtk.widget -> Gtk.widget option -> Gtk.widget option -> unit = "ml_gtk_tree_store_insert_before"

external insert_after : t -> Gtk.widget -> Gtk.widget option -> Gtk.widget option -> unit = "ml_gtk_tree_store_insert_after"

external insert : t -> Gtk.widget -> Gtk.widget option -> int -> unit = "ml_gtk_tree_store_insert"

external clear : t -> unit = "ml_gtk_tree_store_clear"

external append : t -> Gtk.widget -> Gtk.widget option -> unit = "ml_gtk_tree_store_append"

