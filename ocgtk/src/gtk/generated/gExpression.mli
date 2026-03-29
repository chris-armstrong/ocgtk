class type expression_t = object
    method bind : [`object_] Gobject.obj -> string -> [`object_] Gobject.obj option -> Expression_watch.t
    method is_static : unit -> bool
    method ref : unit -> expression_t
    method unref : unit -> unit
    method as_expression : Expression.t
end

class expression : Expression.t -> expression_t

