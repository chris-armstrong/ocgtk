(* GENERATED CODE - DO NOT EDIT *)
(* Expression: Expression *)

type t = [`expression] Gobject.obj

(** Releases a reference on the given `GtkExpression`.

If the reference was the last, the resources associated to the `self` are
freed. *)
external unref : t -> unit = "ml_gtk_expression_unref"

(** Acquires a reference on the given `GtkExpression`. *)
external ref : t -> t = "ml_gtk_expression_ref"

(** Checks if the expression is static.

A static expression will never change its result when
[method@Gtk.Expression.evaluate] is called on it with the same arguments.

That means a call to [method@Gtk.Expression.watch] is not necessary because
it will never trigger a notify. *)
external is_static : t -> bool = "ml_gtk_expression_is_static"

