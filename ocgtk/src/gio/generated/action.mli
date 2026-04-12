(* GENERATED CODE - DO NOT EDIT *)
(* Action: Action *)

type t = [`action] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gio_action_from_gobject"

(* Methods *)
(** Queries the name of @action. *)
external get_name : t -> string = "ml_g_action_get_name"

(** Checks if @action is currently enabled.

An action must be enabled in order to be activated or in order to
have its state changed from outside callers. *)
external get_enabled : t -> bool = "ml_g_action_get_enabled"

(* Properties *)

