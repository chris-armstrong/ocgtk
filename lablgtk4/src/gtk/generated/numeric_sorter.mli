(* GENERATED CODE - DO NOT EDIT *)
(* NumericSorter: NumericSorter *)

type t = [`numeric_sorter | `sorter | `object_] Gobject.obj

(** Create a new NumericSorter *)
external new_ : Expression.t option -> t = "ml_gtk_numeric_sorter_new"

(* Properties *)

(** Sets whether to sort smaller numbers before larger ones. *)
external set_sort_order : t -> Gtk_enums.sorttype -> unit = "ml_gtk_numeric_sorter_set_sort_order"

(** Sets the expression that is evaluated to obtain numbers from items.

Unless an expression is set on @self, the sorter will always
compare items as invalid.

The expression must have a return type that can be compared
numerically, such as %G_TYPE_INT or %G_TYPE_DOUBLE. *)
external set_expression : t -> Expression.t option -> unit = "ml_gtk_numeric_sorter_set_expression"

(** Gets whether this sorter will sort smaller numbers first. *)
external get_sort_order : t -> Gtk_enums.sorttype = "ml_gtk_numeric_sorter_get_sort_order"

(** Gets the expression that is evaluated to obtain numbers from items. *)
external get_expression : t -> Expression.t option = "ml_gtk_numeric_sorter_get_expression"

