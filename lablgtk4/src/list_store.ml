(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ListStore *)

type t = Gtk.Widget.t

external new_ : int -> unit -> t = "ml_gtk_list_store_new"

external newv : int -> unit -> t = "ml_gtk_list_store_newv"

external swap : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_list_store_swap"

external remove : t -> Gtk.Widget.t -> bool = "ml_gtk_list_store_remove"

external prepend : t -> Gtk.Widget.t -> unit = "ml_gtk_list_store_prepend"

external move_before : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_list_store_move_before"

external move_after : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_list_store_move_after"

external iter_is_valid : t -> Gtk.Widget.t -> bool = "ml_gtk_list_store_iter_is_valid"

external insert_before : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_list_store_insert_before"

external insert_after : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_list_store_insert_after"

external insert : t -> Gtk.Widget.t -> int -> unit = "ml_gtk_list_store_insert"

external clear : t -> unit = "ml_gtk_list_store_clear"

external append : t -> Gtk.Widget.t -> unit = "ml_gtk_list_store_append"

