(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Actionable *)

type t = Gtk.Widget.t

(* Properties *)

(** Get property: action-name *)
external get_action_name : t -> string = "ml_gtk_actionable_get_action_name"

(** Set property: action-name *)
external set_action_name : t -> string -> unit = "ml_gtk_actionable_set_action_name"

external set_detailed_action_name : t -> string -> unit = "ml_gtk_actionable_set_detailed_action_name"

external set_action_target_value : t -> unit -> unit = "ml_gtk_actionable_set_action_target_value"

external set_action_target : t -> string -> unit -> unit = "ml_gtk_actionable_set_action_target"

external get_action_target_value : t -> unit = "ml_gtk_actionable_get_action_target_value"

