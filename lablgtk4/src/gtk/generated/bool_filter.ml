(* GENERATED CODE - DO NOT EDIT *)
(* BoolFilter: BoolFilter *)

type t = [`bool_filter | `filter | `object_] Gobject.obj

(** Create a new BoolFilter *)
external new_ : Expression.t option -> t = "ml_gtk_bool_filter_new"

(* Properties *)

(** Get property: invert *)
external get_invert : t -> bool = "ml_gtk_bool_filter_get_invert"

(** Set property: invert *)
external set_invert : t -> bool -> unit = "ml_gtk_bool_filter_set_invert"

(** Sets the expression that the filter uses to check if items
should be filtered.

The expression must have a value type of %G_TYPE_BOOLEAN. *)
external set_expression : t -> Expression.t option -> unit = "ml_gtk_bool_filter_set_expression"

(** Gets the expression that the filter uses to evaluate if
an item should be filtered. *)
external get_expression : t -> Expression.t option = "ml_gtk_bool_filter_get_expression"

