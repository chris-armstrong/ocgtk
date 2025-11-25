(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Actionable *)

type t = Gtk.widget

(* Properties *)

(** Get property: action-name *)
external get_action_name : t -> string = "ml_gtk_actionable_get_action_name"

(** Set property: action-name *)
external set_action_name : t -> string -> unit = "ml_gtk_actionable_set_action_name"

(** Sets the action-name and associated string target value of an
actionable widget.

@detailed_action_name is a string in the format accepted by
[func@Gio.Action.parse_detailed_name]. *)
external set_detailed_action_name : t -> string -> unit = "ml_gtk_actionable_set_detailed_action_name"

