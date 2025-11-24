(* GENERATED CODE - DO NOT EDIT *)
(* Widget: StringSorter *)

type t = Gtk.widget

(** Create a new StringSorter *)
external new_ : Gtk.widget option -> t = "ml_gtk_string_sorter_new"

(* Properties *)

(** Get property: ignore-case *)
external get_ignore_case : t -> bool = "ml_gtk_string_sorter_get_ignore_case"

(** Set property: ignore-case *)
external set_ignore_case : t -> bool -> unit = "ml_gtk_string_sorter_set_ignore_case"

external set_expression : t -> Gtk.widget option -> unit = "ml_gtk_string_sorter_set_expression"

external set_collation : t -> Gtk_enums.collation -> unit = "ml_gtk_string_sorter_set_collation"

external get_expression : t -> Gtk.widget = "ml_gtk_string_sorter_get_expression"

external get_collation : t -> Gtk_enums.collation = "ml_gtk_string_sorter_get_collation"

