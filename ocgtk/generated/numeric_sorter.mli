(** Sorts items numerically.

    To obtain the numbers to compare, this sorter evaluates a [Gtk.Expression].

    Its methods, signals and properties are on {!class-type-numeric_sorter_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Numeric_sorter}. *)

(** The methods, signals and properties of a [NumericSorter]. *)
class type numeric_sorter_t = object
  inherit Sorter.sorter_t

  method get_expression : unit -> Expression.expression_t option
  (** Gets the expression that is evaluated to obtain numbers from items. *)

  method get_sort_order : unit -> Enums.sorttype
  (** Gets whether this sorter will sort smaller numbers first. *)

  method set_expression : Expression.expression_t option -> unit
  (** Sets the expression that is evaluated to obtain numbers from items.

      Unless an expression is set on [self], the sorter will always compare
      items as invalid.

      The expression must have a return type that can be compared numerically,
      such as [G_TYPE_INT] or [G_TYPE_DOUBLE]. *)

  method set_sort_order : Enums.sorttype -> unit
  (** Sets whether to sort smaller numbers before larger ones. *)

  method as_numeric_sorter : Raw.Numeric_sorter.t
end

class numeric_sorter : Raw.Numeric_sorter.t -> numeric_sorter_t
(** Wraps a raw handle of {!Ocgtk.Raw.Numeric_sorter.t}. *)

(** {2:constructors Constructors} *)

val new_ : Expression.expression_t option -> numeric_sorter_t
(** Creates a new numeric sorter using the given [expression].

    Smaller numbers will be sorted first. You can call
    [Gtk.NumericSorter.set_sort_order] to change this. *)
