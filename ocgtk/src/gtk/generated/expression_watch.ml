(* GENERATED CODE - DO NOT EDIT *)
(* ExpressionWatch: ExpressionWatch *)

type t = [ `expression_watch ] Gobject.obj
(** An opaque structure representing a watched `GtkExpression`.

    The contents of `GtkExpressionWatch` should only be accessed through the
    provided API. *)

(* Methods *)

external unwatch : t -> unit = "ml_gtk_expression_watch_unwatch"
(** Stops watching an expression.

    See [method@Gtk.Expression.watch] for how the watch was established. *)

external ref : t -> t = "ml_gtk_expression_watch_ref"
(** Acquires a reference on the given `GtkExpressionWatch`. *)
