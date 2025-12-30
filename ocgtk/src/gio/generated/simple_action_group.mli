(* GENERATED CODE - DO NOT EDIT *)
(* SimpleActionGroup: SimpleActionGroup *)

type t = [`simple_action_group | `object_] Gobject.obj

(** Create a new SimpleActionGroup *)
external new_ : unit -> t = "ml_g_simple_action_group_new"

(* Methods *)
(** Removes the named action from the action group.

If no action of this name is in the group then nothing happens. *)
external remove : t -> string -> unit = "ml_g_simple_action_group_remove"

(** Looks up the action with the name @action_name in the group.

If no such action exists, returns %NULL. *)
external lookup : t -> string -> Action.t = "ml_g_simple_action_group_lookup"

(** Adds an action to the action group.

If the action group already contains an action with the same name as
@action then the old action is dropped from the group.

The action group takes its own reference on @action. *)
external insert : t -> Action.t -> unit = "ml_g_simple_action_group_insert"

