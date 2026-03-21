class type expression_t = object
    method is_static : unit -> bool
    method ref : unit -> expression_t
    method unref : unit -> unit
    method as_expression : Expression.t
end

(* High-level class for Expression *)
class expression (obj : Expression.t) : expression_t = object (self)

  method is_static : unit -> bool =
    fun () ->
      (Expression.is_static obj)

  method ref : unit -> expression_t =
    fun () ->
      new  expression(Expression.ref obj)

  method unref : unit -> unit =
    fun () ->
      (Expression.unref obj)

    method as_expression = obj
end

