(* GENERATED CODE - DO NOT EDIT *)
(* Buildable: Buildable *)

type t = [`buildable] Gobject.obj

(** Gets the ID of the @buildable object.

`GtkBuilder` sets the name based on the ID attribute
of the `<object>` tag used to construct the @buildable. *)
external get_buildable_id : t -> string option = "ml_gtk_buildable_get_buildable_id"

