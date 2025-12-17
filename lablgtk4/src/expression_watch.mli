(* GENERATED CODE - DO NOT EDIT *)
(* ExpressionWatch: ExpressionWatch *)

(** An opaque structure representing a watched `GtkExpression`.

The contents of `GtkExpressionWatch` should only be accessed through the
provided API. *)
type t = [`expression_watch] Gobject.obj

(** Stops watching an expression.

See [method@Gtk.Expression.watch] for how the watch
was established. *)
external unwatch : t -> unit = "ml_gtk_expression_watch_unwatch"

(** Releases a reference on the given `GtkExpressionWatch`.

If the reference was the last, the resources associated to `self` are
freed. *)
external unref : t -> unit = "ml_gtk_expression_watch_unref"

(** Acquires a reference on the given `GtkExpressionWatch`. *)
external ref : t -> t = "ml_gtk_expression_watch_ref"

