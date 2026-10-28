class type bool_filter_t = object
  inherit Filter.filter_t

  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_bool_filter : Raw.Bool_filter.t
end

(* High-level class for BoolFilter *)
class bool_filter (obj : Raw.Bool_filter.t) : bool_filter_t =
  object (self)
    inherit Filter.filter (obj :> Raw.Filter.t)

    method get_expression : unit -> Expression.expression_t option =
      fun () ->
        Option.map
          (fun ret -> new Expression.expression ret)
          (Raw.Bool_filter.get_expression obj)

    method get_invert : unit -> bool = fun () -> Raw.Bool_filter.get_invert obj

    method set_expression : Expression.expression_t option -> unit =
      fun expression ->
        let expression = Option.map (fun c -> c#as_expression) expression in
        Raw.Bool_filter.set_expression obj expression

    method set_invert : bool -> unit =
      fun invert -> Raw.Bool_filter.set_invert obj invert

    method as_bool_filter = obj
  end

let new_ (expression : Expression.expression_t option) : bool_filter_t =
  let expression = Option.map (fun c -> c#as_expression) expression in
  let obj_ = Raw.Bool_filter.new_ expression in
  new bool_filter obj_
