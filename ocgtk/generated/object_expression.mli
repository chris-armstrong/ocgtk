(** A [GObject] value in a [GtkExpression].

    Its methods, signals and properties are on
    {!class-type-object_expression_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Object_expression}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ObjectExpression].}

    A [GObject] value in a [GtkExpression]. *)
class type object_expression_t = object
  inherit Expression.expression_t

  method get_object : unit -> [ `object_ ] Gobject.obj option
  (** Gets the object that the expression evaluates to. *)

  method as_object_expression : Raw.Object_expression.t
end

class object_expression : Raw.Object_expression.t -> object_expression_t
(** Wraps a raw handle of {!Ocgtk.Raw.Object_expression.t}. *)

(** {1:constructors Constructors} *)

val new_ : [ `object_ ] Gobject.obj -> object_expression_t
(** Creates an expression evaluating to the given [object] with a weak
    reference.

    Once the [object] is disposed, it will fail to evaluate.

    This expression is meant to break reference cycles.

    If you want to keep a reference to [object], use
    [Gtk.ConstantExpression.new]. *)
