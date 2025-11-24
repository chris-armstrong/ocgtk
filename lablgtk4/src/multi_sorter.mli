(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MultiSorter *)

type t = Gtk.widget

(** Create a new MultiSorter *)
external new_ : unit -> t = "ml_gtk_multi_sorter_new"

(* Properties *)

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_multi_sorter_get_n_items"

external remove : t -> int -> unit = "ml_gtk_multi_sorter_remove"

external append : t -> Gtk.widget -> unit = "ml_gtk_multi_sorter_append"

