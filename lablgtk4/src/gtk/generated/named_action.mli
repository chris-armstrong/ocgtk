(* GENERATED CODE - DO NOT EDIT *)
(* NamedAction: NamedAction *)

type t = [`named_action | `shortcut_action | `object_] Gobject.obj

(** Create a new NamedAction *)
external new_ : string -> t = "ml_gtk_named_action_new"

(* Properties *)

(** Get property: action-name *)
external get_action_name : t -> string = "ml_gtk_named_action_get_action_name"

