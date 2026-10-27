(* GENERATED CODE - DO NOT EDIT *)
(* PropertyExpression: PropertyExpression *)

(** A [GObject] property value in a [GtkExpression].

    The class built on this module is in {!Ocgtk.Property_expression}. *)

type t = [ `property_expression | `expression ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_property_expression_get_type"

external new_ : Gobject.Type.t -> Expression.t option -> string -> t
  = "ml_gtk_property_expression_new"
(** Creates an expression that looks up a property.

    The object to use is found by evaluating the [expression], or using the
    [this] argument when [expression] is [NULL].

    If the resulting object conforms to [this_type], its property named
    [property_name] will be queried. Otherwise, this expression's evaluation
    will fail.

    The given [this_type] must have a property with [property_name]. *)

(* Methods *)

external get_expression : t -> Expression.t option
  = "ml_gtk_property_expression_get_expression"
(** Gets the expression specifying the object of a property expression. *)
