(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ActionBar *)

type t = [`action_bar | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new ActionBar *)
external new_ : unit -> t = "ml_gtk_action_bar_new"

(* Properties *)

(** Get property: revealed *)
external get_revealed : t -> bool = "ml_gtk_action_bar_get_revealed"

(** Set property: revealed *)
external set_revealed : t -> bool -> unit = "ml_gtk_action_bar_set_revealed"

(** Sets the center widget for the `GtkActionBar`. *)
external set_center_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_action_bar_set_center_widget"

(** Removes a child from @action_bar. *)
external remove : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_action_bar_remove"

(** Adds @child to @action_bar, packed with reference to the
start of the @action_bar. *)
external pack_start : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_action_bar_pack_start"

(** Adds @child to @action_bar, packed with reference to the
end of the @action_bar. *)
external pack_end : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_action_bar_pack_end"

(** Retrieves the center bar widget of the bar. *)
external get_center_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_action_bar_get_center_widget"

