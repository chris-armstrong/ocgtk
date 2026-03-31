class type expression_t = object
    method bind : [`object_] Gobject.obj -> string -> [`object_] Gobject.obj option -> Expression_watch.t
    method is_static : unit -> bool
    method ref : unit -> expression_t
    method unref : unit -> unit
    method as_expression : Expression.t
end

(* High-level class for Expression *)
class expression (obj : Expression.t) : expression_t = object (self)

  method bind : [`object_] Gobject.obj -> string -> [`object_] Gobject.obj option -> Expression_watch.t =
    fun target property this_ ->
      (Expression.bind obj target property this_)

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

