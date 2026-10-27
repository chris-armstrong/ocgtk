(** An opaque structure representing a watched [GtkExpression].

    The contents of [GtkExpressionWatch] should only be accessed through the
    provided API.

    Its methods, signals and properties are on {!class-type-expression_watch_t}.
    The functions it is built on are in {!Ocgtk.Raw.Expression_watch}. *)

(** The methods, signals and properties of a [GtkExpressionWatch]. *)
class type expression_watch_t = object
  method evaluate : Gobject.Value.t -> bool
  method ref : unit -> Raw.Expression_watch.t
  method unwatch : unit -> unit
  method as_expression_watch : Raw.Expression_watch.t
end

class expression_watch : Raw.Expression_watch.t -> expression_watch_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Expression_watch.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkExpressionWatch], give one already wrapped. *)
