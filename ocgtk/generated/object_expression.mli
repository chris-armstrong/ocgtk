(** A [GObject] value in a [GtkExpression].

    Its methods, signals and properties are on
    {!class-type-object_expression_t}. The functions it is built on are in
    {!Ocgtk.Raw.Object_expression}. *)

(** The methods, signals and properties of a [GtkObjectExpression]. *)
class type object_expression_t = object
  inherit Expression.expression_t
  method get_object : unit -> [ `object_ ] Gobject.obj option
  method as_object_expression : Raw.Object_expression.t
end

class object_expression : Raw.Object_expression.t -> object_expression_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Object_expression.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkObjectExpression], give one already wrapped. *)

val new_ : [ `object_ ] Gobject.obj -> object_expression_t
