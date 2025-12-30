(* GENERATED CODE - DO NOT EDIT *)
(* Actionable: Actionable *)

type t = [`actionable] Gobject.obj

(* Methods *)
(** Sets the action-name and associated string target value of an
actionable widget.

@detailed_action_name is a string in the format accepted by
[func@Gio.Action.parse_detailed_name]. *)
external set_detailed_action_name : t -> string -> unit = "ml_gtk_actionable_set_detailed_action_name"

(** Specifies the name of the action with which this widget should be
associated.

If @action_name is %NULL then the widget will be unassociated from
any previous action.

Usually this function is used when the widget is located (or will be
located) within the hierarchy of a `GtkApplicationWindow`.

Names are of the form “win.save” or “app.quit” for actions on the
containing [class@ApplicationWindow] or its associated [class@Application],
respectively. This is the same form used for actions in the [class@Gio.Menu]
associated with the window. *)
external set_action_name : t -> string option -> unit = "ml_gtk_actionable_set_action_name"

(** Gets the action name for @actionable. *)
external get_action_name : t -> string option = "ml_gtk_actionable_get_action_name"

(* Properties *)

