(* GENERATED CODE - DO NOT EDIT *)
(* ActionMap: ActionMap *)

type t = [`action_map] Gobject.obj

(* Methods *)
(** Removes the named action from the action map.

If no action of this name is in the map then nothing happens. *)
external remove_action : t -> string -> unit = "ml_g_action_map_remove_action"

