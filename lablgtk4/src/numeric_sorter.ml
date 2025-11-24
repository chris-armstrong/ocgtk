(* GENERATED CODE - DO NOT EDIT *)
(* Widget: NumericSorter *)

type t = Gtk.widget

external new_ : Gtk.widget option -> t = "ml_gtk_numeric_sorter_new"

(* Properties *)

external set_sort_order : t -> Gtk_enums.sorttype -> unit = "ml_gtk_numeric_sorter_set_sort_order"

external set_expression : t -> Gtk.widget option -> unit = "ml_gtk_numeric_sorter_set_expression"

external get_sort_order : t -> Gtk_enums.sorttype = "ml_gtk_numeric_sorter_get_sort_order"

external get_expression : t -> Gtk.widget = "ml_gtk_numeric_sorter_get_expression"

