(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PropertyExpression *)

type t = Gtk.widget

(** Create a new PropertyExpression *)
external new_ : unit -> Gtk.widget option -> string -> t = "ml_gtk_property_expression_new"

(** Create a new PropertyExpression *)
external new_for_pspec : Gtk.widget option -> unit -> t = "ml_gtk_property_expression_new_for_pspec"

(** Gets the expression specifying the object of
a property expression. *)
external get_expression : t -> Gtk.widget = "ml_gtk_property_expression_get_expression"

