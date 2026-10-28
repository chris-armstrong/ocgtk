(** Sorts items by comparing strings.

    Its methods, signals and properties are on {!class-type-string_sorter_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.String_sorter}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [StringSorter].}

    Sorts items by comparing strings.

    To obtain the strings to compare, this sorter evaluates a [Gtk.Expression].

    It does the comparison in a linguistically correct way using the current
    locale by normalizing Unicode strings and possibly case-folding them before
    performing the comparison. *)
class type string_sorter_t = object
  inherit Sorter.sorter_t

  method get_collation : unit -> Enums.collation
  (** Gets which collation method the sorter uses. *)

  method get_expression : unit -> Expression.expression_t option
  (** Gets the expression that is evaluated to obtain strings from items. *)

  method get_ignore_case : unit -> bool
  (** Gets whether the sorter ignores case differences. *)

  method set_collation : Enums.collation -> unit
  (** Sets the collation method to use for sorting. *)

  method set_expression : Expression.expression_t option -> unit
  (** Sets the expression that is evaluated to obtain strings from items.

      The expression must have the type [G_TYPE_STRING]. *)

  method set_ignore_case : bool -> unit
  (** Sets whether the sorter will ignore case differences. *)

  method as_string_sorter : Raw.String_sorter.t
end

class string_sorter : Raw.String_sorter.t -> string_sorter_t
(** Wraps a raw handle of {!Ocgtk.Raw.String_sorter.t}. *)

(** {1:description Description}

    Sorts items by comparing strings.

    To obtain the strings to compare, this sorter evaluates a [Gtk.Expression].

    It does the comparison in a linguistically correct way using the current
    locale by normalizing Unicode strings and possibly case-folding them before
    performing the comparison. *)

(** {1:constructors Constructors} *)

val new_ : Expression.expression_t option -> string_sorter_t
(** Creates a new string sorter that compares items using the given
    [expression].

    Unless an expression is set on it, this sorter will always compare items as
    invalid. *)
