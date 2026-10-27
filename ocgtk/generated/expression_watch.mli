(** An opaque structure representing a watched [GtkExpression].

    The contents of [GtkExpressionWatch] should only be accessed through the
    provided API.

    Its methods, signals and properties are on {!class-type-expression_watch_t}.
    The functions it is built on are in {!Ocgtk.Raw.Expression_watch}. *)

(** The methods, signals and properties of a [GtkExpressionWatch]. *)
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

class expression_watch : Raw.Expression_watch.t -> expression_watch_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Expression_watch.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkExpressionWatch], give one already wrapped. *)
