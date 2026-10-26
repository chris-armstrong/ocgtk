class type expression_watch_t = object
  method evaluate : Gobject.Value.t -> bool
  method ref : unit -> Raw.Expression_watch.t
  method unwatch : unit -> unit
  method as_expression_watch : Raw.Expression_watch.t
end

class expression_watch : Raw.Expression_watch.t -> expression_watch_t
