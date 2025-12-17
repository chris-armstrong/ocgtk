(* High-level class for Expression *)
class expression (obj : Expression.t) = object (self)

  method is_static : unit -> bool = fun () -> (Expression.is_static obj )

  method ref : unit -> expression = fun () -> new  expression(Expression.ref obj )

  method unref : unit -> unit = fun () -> (Expression.unref obj )

    method as_expression = obj
end

