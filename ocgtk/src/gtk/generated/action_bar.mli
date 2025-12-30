(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ActionBar *)

type t = [`action_bar | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new ActionBar *)
external new_ : unit -> t = "ml_gtk_action_bar_new"

(* Methods *)
(** Reveals or conceals the content of the action bar.

Note: this does not show or hide @action_bar in the
[property@Gtk.Widget:visible] sense, so revealing has
no effect if the action bar is hidden. *)
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

(** Gets whether the contents of the action bar are revealed. *)
external get_revealed : t -> bool = "ml_gtk_action_bar_get_revealed"

(** Retrieves the center bar widget of the bar. *)
external get_center_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_action_bar_get_center_widget"

(* Properties *)

