(** Sorts items by comparing strings.

    To obtain the strings to compare, this sorter evaluates a [Gtk.Expression].

    It does the comparison in a linguistically correct way using the current
    locale by normalizing Unicode strings and possibly case-folding them before
    performing the comparison.

    Its methods, signals and properties are on {!class-type-string_sorter_t}.
    The functions it is built on are in {!Ocgtk.Raw.String_sorter}. *)

(** The methods, signals and properties of a [GtkStringSorter]. *)
class type string_sorter_t = object
  inherit Sorter.sorter_t
  method get_collation : unit -> Enums.collation
  method get_expression : unit -> Expression.expression_t option
  method get_ignore_case : unit -> bool
  method set_collation : Enums.collation -> unit
  method set_expression : Expression.expression_t option -> unit
  method set_ignore_case : bool -> unit
  method as_string_sorter : Raw.String_sorter.t
end

class string_sorter : Raw.String_sorter.t -> string_sorter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.String_sorter.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkStringSorter], give one already wrapped. *)

val new_ : Expression.expression_t option -> string_sorter_t
