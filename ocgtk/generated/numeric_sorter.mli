(** Sorts items numerically.

    To obtain the numbers to compare, this sorter evaluates a [Gtk.Expression].

    Its methods, signals and properties are on {!class-type-numeric_sorter_t}.
    The functions it is built on are in {!Ocgtk.Raw.Numeric_sorter}. *)

(** The methods, signals and properties of a [GtkNumericSorter]. *)
class type numeric_sorter_t = object
  inherit Sorter.sorter_t
  method get_expression : unit -> Expression.expression_t option
  method get_sort_order : unit -> Enums.sorttype
  method set_expression : Expression.expression_t option -> unit
  method set_sort_order : Enums.sorttype -> unit
  method as_numeric_sorter : Raw.Numeric_sorter.t
end

class numeric_sorter : Raw.Numeric_sorter.t -> numeric_sorter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Numeric_sorter.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkNumericSorter], give one already wrapped. *)

val new_ : Expression.expression_t option -> numeric_sorter_t
