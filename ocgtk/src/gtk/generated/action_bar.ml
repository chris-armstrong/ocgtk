(* GENERATED CODE - DO NOT EDIT *)
(* ActionBar: ActionBar *)

type t = [ `action_bar | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_action_bar_new"
(** Create a new ActionBar *)

(* Methods *)

external set_revealed : t -> bool -> unit = "ml_gtk_action_bar_set_revealed"
(** Reveals or conceals the content of the action bar.

Note: this does not show or hide @action_bar in the
[property@Gtk.Widget:visible] sense, so revealing has
no effect if the action bar is hidden. *)

external set_center_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_action_bar_set_center_widget"
(** Sets the center widget for the `GtkActionBar`. *)

external remove :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_action_bar_remove"
(** Removes a child from @action_bar. *)

external pack_start :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_action_bar_pack_start"
(** Adds @child to @action_bar, packed with reference to the
start of the @action_bar. *)

external pack_end :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_action_bar_pack_end"
(** Adds @child to @action_bar, packed with reference to the
end of the @action_bar. *)

external get_revealed : t -> bool = "ml_gtk_action_bar_get_revealed"
(** Gets whether the contents of the action bar are revealed. *)

external get_center_widget :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
  .Widget
  .t
  option = "ml_gtk_action_bar_get_center_widget"
(** Retrieves the center bar widget of the bar. *)

(* Properties *)
