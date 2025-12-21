(* GENERATED CODE - DO NOT EDIT *)
(* StringFilter: StringFilter *)

type t = [`string_filter | `filter | `object_] Gobject.obj

(** Create a new StringFilter *)
external new_ : Expression.t option -> t = "ml_gtk_string_filter_new"

(* Methods *)
(** Sets the string to search for. *)
external set_search : t -> string option -> unit = "ml_gtk_string_filter_set_search"

(** Sets the match mode for the filter. *)
external set_match_mode : t -> Gtk_enums.stringfiltermatchmode -> unit = "ml_gtk_string_filter_set_match_mode"

(** Sets whether the filter ignores case differences. *)
external set_ignore_case : t -> bool -> unit = "ml_gtk_string_filter_set_ignore_case"

(** Sets the expression that the string filter uses to
obtain strings from items.

The expression must have a value type of %G_TYPE_STRING. *)
external set_expression : t -> Expression.t option -> unit = "ml_gtk_string_filter_set_expression"

(** Gets the search term. *)
external get_search : t -> string option = "ml_gtk_string_filter_get_search"

(** Returns the match mode that the filter is using. *)
external get_match_mode : t -> Gtk_enums.stringfiltermatchmode = "ml_gtk_string_filter_get_match_mode"

(** Returns whether the filter ignores case differences. *)
external get_ignore_case : t -> bool = "ml_gtk_string_filter_get_ignore_case"

(** Gets the expression that the string filter uses to
obtain strings from items. *)
external get_expression : t -> Expression.t option = "ml_gtk_string_filter_get_expression"

(* Properties *)

