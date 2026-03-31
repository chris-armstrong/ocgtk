(* GENERATED CODE - DO NOT EDIT *)
(* Expression: Expression *)

type t = [`expression] Gobject.obj

(* Methods *)
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

(** Bind `target`'s property named `property` to `self`.

The value that `self` evaluates to is set via `g_object_set()` on
`target`. This is repeated whenever `self` changes to ensure that
the object's property stays synchronized with `self`.

If `self`'s evaluation fails, `target`'s `property` is not updated.
You can ensure that this doesn't happen by using a fallback
expression.

Note that this function takes ownership of `self`. If you want
to keep it around, you should [method@Gtk.Expression.ref] it beforehand. *)
external bind : t -> [`object_] Gobject.obj -> string -> [`object_] Gobject.obj option -> Expression_watch.t = "ml_gtk_expression_bind"

