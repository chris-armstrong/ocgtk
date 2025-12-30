(* GENERATED CODE - DO NOT EDIT *)
(* Shortcut: Shortcut *)

type t = [`shortcut | `object_] Gobject.obj

(** Create a new Shortcut *)
external new_ : Shortcut_trigger.t option -> Shortcut_action.t option -> t = "ml_gtk_shortcut_new"

(** Create a new Shortcut *)
external new_with_arguments : Shortcut_trigger.t option -> Shortcut_action.t option -> string option -> unit -> t = "ml_gtk_shortcut_new_with_arguments"

(* Methods *)
(** Sets the new trigger for @self to be @trigger. *)
external set_trigger : t -> Shortcut_trigger.t option -> unit = "ml_gtk_shortcut_set_trigger"

(** Sets the new action for @self to be @action. *)
external set_action : t -> Shortcut_action.t option -> unit = "ml_gtk_shortcut_set_action"

(** Gets the trigger used to trigger @self. *)
external get_trigger : t -> Shortcut_trigger.t option = "ml_gtk_shortcut_get_trigger"

(** Gets the action that is activated by this shortcut. *)
external get_action : t -> Shortcut_action.t option = "ml_gtk_shortcut_get_action"

(* Properties *)

