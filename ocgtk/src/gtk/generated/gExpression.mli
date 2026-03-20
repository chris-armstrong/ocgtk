class type expression_t = object
    method is_static : unit -> bool
    method ref : unit -> expression_t
    method unref : unit -> unit
    method as_expression : Expression.t
end

class expression : Expression.t -> expression_t

