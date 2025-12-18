class expression_watch : Expression_watch.t ->
  object
    method ref : unit -> Expression_watch.t
    method unref : unit -> unit
    method unwatch : unit -> unit
    method as_expression_watch : Expression_watch.t
  end

