(* GENERATED CODE - DO NOT EDIT *)
(* ObjectExpression: ObjectExpression *)

(** A [GObject] value in a [GtkExpression].

    The class built on this module is in {!Ocgtk.Object_expression}. *)

type t = [ `object_expression | `expression ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_object_expression_get_type"

external new_ : [ `object_ ] Gobject.obj -> t = "ml_gtk_object_expression_new"
(** Creates an expression evaluating to the given [object] with a weak
    reference.

    Once the [object] is disposed, it will fail to evaluate.

    This expression is meant to break reference cycles.

    If you want to keep a reference to [object], use
    [Gtk.ConstantExpression.new]. *)

(* Methods *)

external get_object : t -> [ `object_ ] Gobject.obj option
  = "ml_gtk_object_expression_get_object"
(** Gets the object that the expression evaluates to. *)
