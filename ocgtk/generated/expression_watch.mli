(** An opaque structure representing a watched [GtkExpression].

    Its methods, signals and properties are on {!class-type-expression_watch_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgtk.Raw.Expression_watch}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ExpressionWatch].}

    An opaque structure representing a watched [GtkExpression].

    The contents of [GtkExpressionWatch] should only be accessed through the
    provided API. *)
class type expression_watch_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_expression_watch : Raw.Expression_watch.t
end

class expression_watch : Raw.Expression_watch.t -> expression_watch_t
(** Wraps a raw handle of {!Ocgtk.Raw.Expression_watch.t}. *)

(** {1:description Description}

    An opaque structure representing a watched [GtkExpression].

    The contents of [GtkExpressionWatch] should only be accessed through the
    provided API. *)
