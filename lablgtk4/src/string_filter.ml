(* GENERATED CODE - DO NOT EDIT *)
(* Widget: StringFilter *)

type t = Gtk.widget

external new_ : Gtk.widget option -> t = "ml_gtk_string_filter_new"

(* Properties *)

external get_ignore_case : t -> bool = "ml_gtk_string_filter_get_ignore_case"

external set_ignore_case : t -> bool -> unit = "ml_gtk_string_filter_set_ignore_case"

external get_search : t -> string = "ml_gtk_string_filter_get_search"

external set_search : t -> string -> unit = "ml_gtk_string_filter_set_search"

external set_match_mode : t -> Gtk_enums.stringfiltermatchmode -> unit = "ml_gtk_string_filter_set_match_mode"

external set_expression : t -> Gtk.widget option -> unit = "ml_gtk_string_filter_set_expression"

external get_match_mode : t -> Gtk_enums.stringfiltermatchmode = "ml_gtk_string_filter_get_match_mode"

external get_expression : t -> Gtk.widget = "ml_gtk_string_filter_get_expression"

