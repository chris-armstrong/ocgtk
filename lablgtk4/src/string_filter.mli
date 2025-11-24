(* GENERATED CODE - DO NOT EDIT *)
(* Widget: StringFilter *)

type t = Gtk.Widget.t

(** Create a new StringFilter *)
external new_ : Gtk.Widget.t option -> t = "ml_gtk_string_filter_new"

(* Properties *)

(** Get property: ignore-case *)
external get_ignore_case : t -> bool = "ml_gtk_string_filter_get_ignore_case"

(** Set property: ignore-case *)
external set_ignore_case : t -> bool -> unit = "ml_gtk_string_filter_set_ignore_case"

(** Get property: search *)
external get_search : t -> string = "ml_gtk_string_filter_get_search"

(** Set property: search *)
external set_search : t -> string -> unit = "ml_gtk_string_filter_set_search"

external set_match_mode : t -> Gtk_enums.stringfiltermatchmode -> unit = "ml_gtk_string_filter_set_match_mode"

external set_expression : t -> Gtk.Widget.t option -> unit = "ml_gtk_string_filter_set_expression"

external get_match_mode : t -> Gtk_enums.stringfiltermatchmode = "ml_gtk_string_filter_get_match_mode"

external get_expression : t -> Gtk.Widget.t = "ml_gtk_string_filter_get_expression"

