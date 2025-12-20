(* GENERATED CODE - DO NOT EDIT *)
(* SimpleActionGroup: SimpleActionGroup *)

type t = [`simple_action_group | `object_] Gobject.obj

(** Create a new SimpleActionGroup *)
external new_ : unit -> t = "ml_g_simple_action_group_new"

(* Methods *)
(** Removes the named action from the action group.

If no action of this name is in the group then nothing happens. *)
external remove : t -> string -> unit = "ml_g_simple_action_group_remove"

