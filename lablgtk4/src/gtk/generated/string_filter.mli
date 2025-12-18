(* GENERATED CODE - DO NOT EDIT *)
(* StringFilter: StringFilter *)

type t = [`string_filter | `filter | `object_] Gobject.obj

(** Create a new StringFilter *)
external new_ : Expression.t option -> t = "ml_gtk_string_filter_new"

(* Properties *)

(** Get property: ignore-case *)
external get_ignore_case : t -> bool = "ml_gtk_string_filter_get_ignore_case"

(** Set property: ignore-case *)
external set_ignore_case : t -> bool -> unit = "ml_gtk_string_filter_set_ignore_case"

(** Get property: search *)
external get_search : t -> string = "ml_gtk_string_filter_get_search"

(** Set property: search *)
external set_search : t -> string -> unit = "ml_gtk_string_filter_set_search"

(** Sets the match mode for the filter. *)
external set_match_mode : t -> Gtk_enums.stringfiltermatchmode -> unit = "ml_gtk_string_filter_set_match_mode"

(** Sets the expression that the string filter uses to
obtain strings from items.

The expression must have a value type of %G_TYPE_STRING. *)
external set_expression : t -> Expression.t option -> unit = "ml_gtk_string_filter_set_expression"

(** Returns the match mode that the filter is using. *)
external get_match_mode : t -> Gtk_enums.stringfiltermatchmode = "ml_gtk_string_filter_get_match_mode"

(** Gets the expression that the string filter uses to
obtain strings from items. *)
external get_expression : t -> Expression.t option = "ml_gtk_string_filter_get_expression"

