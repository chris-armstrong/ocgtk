(* GENERATED CODE - DO NOT EDIT *)
(* Widget: NamedAction *)

type t = Gtk.widget

(** Create a new NamedAction *)
external new_ : string -> t = "ml_gtk_named_action_new"

(* Properties *)

(** Returns the name of the action that will be activated. *)
external get_action_name : t -> string = "ml_gtk_named_action_get_action_name"

