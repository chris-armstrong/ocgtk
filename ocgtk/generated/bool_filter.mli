(** Evaluates a boolean expression to determine whether to include items.

    Its methods, signals and properties are on {!class-type-bool_filter_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Bool_filter}. *)

(** The methods, signals and properties of a [GtkBoolFilter]. *)
class type bool_filter_t = object
  inherit Filter.filter_t

  method get_expression : unit -> Expression.expression_t option
  (** Gets the expression that the filter evaluates for each item. *)

  method get_invert : unit -> bool
  (** Returns whether the filter inverts the expression. *)

  method set_expression : Expression.expression_t option -> unit
  (** Sets the expression that the filter uses to check if items should be
      filtered.

      The expression must have a value type of [G_TYPE_BOOLEAN]. *)

  method set_invert : bool -> unit
  (** Sets whether the filter should invert the expression. *)

  method as_bool_filter : Raw.Bool_filter.t
end

class bool_filter : Raw.Bool_filter.t -> bool_filter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Bool_filter.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkBoolFilter], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : Expression.expression_t option -> bool_filter_t
(** Creates a new bool filter. *)
