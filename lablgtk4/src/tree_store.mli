(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeStore *)

type t = Gtk.Widget.t

(** Create a new TreeStore *)
external new_ : int -> unit -> t = "ml_gtk_tree_store_new"

(** Create a new TreeStore *)
external newv : int -> unit -> t = "ml_gtk_tree_store_newv"

external swap : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_tree_store_swap"

external remove : t -> Gtk.Widget.t -> bool = "ml_gtk_tree_store_remove"

external prepend : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_tree_store_prepend"

external move_before : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_tree_store_move_before"

external move_after : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_tree_store_move_after"

external iter_is_valid : t -> Gtk.Widget.t -> bool = "ml_gtk_tree_store_iter_is_valid"

external iter_depth : t -> Gtk.Widget.t -> int = "ml_gtk_tree_store_iter_depth"

external is_ancestor : t -> Gtk.Widget.t -> Gtk.Widget.t -> bool = "ml_gtk_tree_store_is_ancestor"

external insert_before : t -> Gtk.Widget.t -> Gtk.Widget.t option -> Gtk.Widget.t option -> unit = "ml_gtk_tree_store_insert_before"

external insert_after : t -> Gtk.Widget.t -> Gtk.Widget.t option -> Gtk.Widget.t option -> unit = "ml_gtk_tree_store_insert_after"

external insert : t -> Gtk.Widget.t -> Gtk.Widget.t option -> int -> unit = "ml_gtk_tree_store_insert"

external clear : t -> unit = "ml_gtk_tree_store_clear"

external append : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_tree_store_append"

