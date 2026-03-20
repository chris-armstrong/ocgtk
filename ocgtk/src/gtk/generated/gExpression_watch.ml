class type expression_watch_t = object
    method ref : unit -> Expression_watch.t
    method unref : unit -> unit
    method unwatch : unit -> unit
    method as_expression_watch : Expression_watch.t
end

(* High-level class for ExpressionWatch *)
class expression_watch (obj : Expression_watch.t) : expression_watch_t = object (self)

  method ref : unit -> Expression_watch.t =
    fun () ->
      (Expression_watch.ref obj)

  method unref : unit -> unit =
    fun () ->
      (Expression_watch.unref obj)

  method unwatch : unit -> unit =
    fun () ->
      (Expression_watch.unwatch obj)

    method as_expression_watch = obj
end

