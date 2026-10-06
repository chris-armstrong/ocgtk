(* GENERATED CODE - DO NOT EDIT *)
(* ObjectExpression: ObjectExpression *)

(** A [GObject] value in a [GtkExpression]. *)

type t = [ `object_expression | `expression ] Gobject.obj

external new_ : [ `object_ ] Gobject.obj -> t = "ml_gtk_object_expression_new"
(** Create a new ObjectExpression *)

(* Methods *)

external get_object : t -> [ `object_ ] Gobject.obj option
  = "ml_gtk_object_expression_get_object"
(** Gets the object that the expression evaluates to. *)
