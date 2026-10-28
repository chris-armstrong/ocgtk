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

(* High-level class for StringSorter *)
class string_sorter (obj : Raw.String_sorter.t) : string_sorter_t =
  object (self)
    inherit Sorter.sorter (obj :> Raw.Sorter.t)

    method get_collation : unit -> Enums.collation =
      fun () -> Raw.String_sorter.get_collation obj

    method get_expression : unit -> Expression.expression_t option =
      fun () ->
        Option.map
          (fun ret -> new Expression.expression ret)
          (Raw.String_sorter.get_expression obj)

    method get_ignore_case : unit -> bool =
      fun () -> Raw.String_sorter.get_ignore_case obj

    method set_collation : Enums.collation -> unit =
      fun collation -> Raw.String_sorter.set_collation obj collation

    method set_expression : Expression.expression_t option -> unit =
      fun expression ->
        let expression = Option.map (fun c -> c#as_expression) expression in
        Raw.String_sorter.set_expression obj expression

    method set_ignore_case : bool -> unit =
      fun ignore_case -> Raw.String_sorter.set_ignore_case obj ignore_case

    method as_string_sorter = obj
  end

let new_ (expression : Expression.expression_t option) : string_sorter_t =
  let expression = Option.map (fun c -> c#as_expression) expression in
  let obj_ = Raw.String_sorter.new_ expression in
  new string_sorter obj_
