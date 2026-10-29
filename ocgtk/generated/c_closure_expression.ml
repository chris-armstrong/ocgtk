class type c_closure_expression_t = object
  inherit Expression.expression_t

  (** {2:conversions Conversions} *)

  method as_c_closure_expression : Raw.C_closure_expression.t
end

(* High-level class for CClosureExpression *)
class c_closure_expression (obj : Raw.C_closure_expression.t) :
  c_closure_expression_t =
  object (self)
    inherit Expression.expression (obj :> Raw.Expression.t)
    method as_c_closure_expression = obj
  end
