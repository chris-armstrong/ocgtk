(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Expression *)

type t = Gtk.Widget.t

external watch : t -> unit -> unit -> unit -> unit -> Gtk.Widget.t = "ml_gtk_expression_watch"

external unref : t -> unit = "ml_gtk_expression_unref"

external ref : t -> Gtk.Widget.t = "ml_gtk_expression_ref"

external is_static : t -> bool = "ml_gtk_expression_is_static"

external evaluate : t -> unit -> unit -> bool = "ml_gtk_expression_evaluate"

external bind : t -> unit -> string -> unit -> Gtk.Widget.t = "ml_gtk_expression_bind"

