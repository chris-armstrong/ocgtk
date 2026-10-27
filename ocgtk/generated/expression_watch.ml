class type expression_watch_t = object
  method evaluate : Gobject.Value.t -> bool
  (** Evaluates the watched expression and on success stores the result in
      [value].

      This is equivalent to calling [Gtk.Expression.evaluate] with the
      expression and this pointer originally used to create [watch]. *)

  method ref : unit -> Raw.Expression_watch.t
  (** Acquires a reference on the given [GtkExpressionWatch]. *)

  method unwatch : unit -> unit
  (** Stops watching an expression.

      See [Gtk.Expression.watch] for how the watch was established. *)

  method as_expression_watch : Raw.Expression_watch.t
end

(* High-level class for ExpressionWatch *)
class expression_watch (obj : Raw.Expression_watch.t) : expression_watch_t =
  object (self)
    method evaluate : Gobject.Value.t -> bool =
      fun value -> Raw.Expression_watch.evaluate obj value

    method ref : unit -> Raw.Expression_watch.t =
      fun () -> Raw.Expression_watch.ref obj

    method unwatch : unit -> unit = fun () -> Raw.Expression_watch.unwatch obj
    method as_expression_watch = obj
  end
