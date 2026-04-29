class type expression_watch_t = object
  method ref : unit -> Expression_watch.t
  method unwatch : unit -> unit
  method as_expression_watch : Expression_watch.t
end

class expression_watch : Expression_watch.t -> expression_watch_t
