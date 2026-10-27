(** Evaluates a boolean expression to determine whether to include items.

    Its methods, signals and properties are on {!class-type-bool_filter_t}. The
    functions it is built on are in {!Ocgtk.Raw.Bool_filter}. *)

(** The methods, signals and properties of a [GtkBoolFilter]. *)
class type bool_filter_t = object
  inherit Filter.filter_t
  method get_expression : unit -> Expression.expression_t option
  method get_invert : unit -> bool
  method set_expression : Expression.expression_t option -> unit
  method set_invert : bool -> unit
  method as_bool_filter : Raw.Bool_filter.t
end

class bool_filter : Raw.Bool_filter.t -> bool_filter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Bool_filter.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkBoolFilter], give one already wrapped. *)

val new_ : Expression.expression_t option -> bool_filter_t
