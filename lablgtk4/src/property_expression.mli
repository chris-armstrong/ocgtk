(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PropertyExpression *)

type t = Gtk.Widget.t

(** Create a new PropertyExpression *)
external new_ : unit -> Gtk.Widget.t option -> string -> t = "ml_gtk_property_expression_new"

(** Create a new PropertyExpression *)
external new_for_pspec : Gtk.Widget.t option -> unit -> t = "ml_gtk_property_expression_new_for_pspec"

external get_expression : t -> Gtk.Widget.t = "ml_gtk_property_expression_get_expression"

