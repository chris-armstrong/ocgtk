class expression : Expression.t ->
  object
    method is_static : unit -> bool
    method ref : unit -> expression
    method unref : unit -> unit
    method as_expression : Expression.t
  end

