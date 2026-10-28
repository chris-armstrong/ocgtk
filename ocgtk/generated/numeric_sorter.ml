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

(* High-level class for NumericSorter *)
class numeric_sorter (obj : Raw.Numeric_sorter.t) : numeric_sorter_t =
  object (self)
    inherit Sorter.sorter (obj :> Raw.Sorter.t)

    method get_expression : unit -> Expression.expression_t option =
      fun () ->
        Option.map
          (fun ret -> new Expression.expression ret)
          (Raw.Numeric_sorter.get_expression obj)

    method get_sort_order : unit -> Enums.sorttype =
      fun () -> Raw.Numeric_sorter.get_sort_order obj

    method set_expression : Expression.expression_t option -> unit =
      fun expression ->
        let expression = Option.map (fun c -> c#as_expression) expression in
        Raw.Numeric_sorter.set_expression obj expression

    method set_sort_order : Enums.sorttype -> unit =
      fun sort_order -> Raw.Numeric_sorter.set_sort_order obj sort_order

    method as_numeric_sorter = obj
  end

let new_ (expression : Expression.expression_t option) : numeric_sorter_t =
  let expression = Option.map (fun c -> c#as_expression) expression in
  let obj_ = Raw.Numeric_sorter.new_ expression in
  new numeric_sorter obj_
