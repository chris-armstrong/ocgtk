(* GENERATED CODE - DO NOT EDIT *)
(* ActionGroup: ActionGroup *)

type t = [`action_group] Gobject.obj

(* Methods *)
(** Checks if the named action exists within @action_group. *)
external has_action : t -> string -> bool = "ml_g_action_group_has_action"

(** Checks if the named action within @action_group is currently enabled.

An action must be enabled in order to be activated or in order to
have its state changed from outside callers. *)
external get_action_enabled : t -> string -> bool = "ml_g_action_group_get_action_enabled"

(** Emits the #GActionGroup::action-removed signal on @action_group.

This function should only be called by #GActionGroup implementations. *)
external action_removed : t -> string -> unit = "ml_g_action_group_action_removed"

(** Emits the #GActionGroup::action-enabled-changed signal on @action_group.

This function should only be called by #GActionGroup implementations. *)
external action_enabled_changed : t -> string -> bool -> unit = "ml_g_action_group_action_enabled_changed"

(** Emits the #GActionGroup::action-added signal on @action_group.

This function should only be called by #GActionGroup implementations. *)
external action_added : t -> string -> unit = "ml_g_action_group_action_added"

