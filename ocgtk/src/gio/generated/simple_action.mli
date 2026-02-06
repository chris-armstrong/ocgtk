(* GENERATED CODE - DO NOT EDIT *)
(* SimpleAction: SimpleAction *)

type t = [`simple_action | `object_] Gobject.obj

(** Create a new SimpleAction *)
external new_ : string -> unit -> t = "ml_g_simple_action_new"

(** Create a new SimpleAction *)
external new_stateful : string -> unit -> unit -> t = "ml_g_simple_action_new_stateful"

(* Methods *)
(** Sets the action as enabled or not.

An action must be enabled in order to be activated or in order to
have its state changed from outside callers.

This should only be called by the implementor of the action.  Users
of the action should not attempt to modify its enabled flag. *)
external set_enabled : t -> bool -> unit = "ml_g_simple_action_set_enabled"

(* Properties *)

(** Get property: name *)
external get_name : t -> string = "ml_g_simple_action_get_name"

