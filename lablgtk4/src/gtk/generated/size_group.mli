(* GENERATED CODE - DO NOT EDIT *)
(* SizeGroup: SizeGroup *)

type t = [`size_group | `object_] Gobject.obj

(** Create a new SizeGroup *)
external new_ : Gtk_enums.sizegroupmode -> t = "ml_gtk_size_group_new"

(* Methods *)
(** Sets the `GtkSizeGroupMode` of the size group.

The mode of the size group determines whether the widgets in the
size group should all have the same horizontal requisition
(%GTK_SIZE_GROUP_HORIZONTAL) all have the same vertical requisition
(%GTK_SIZE_GROUP_VERTICAL), or should all have the same requisition
in both directions (%GTK_SIZE_GROUP_BOTH). *)
external set_mode : t -> Gtk_enums.sizegroupmode -> unit = "ml_gtk_size_group_set_mode"

(** Removes a widget from a `GtkSizeGroup`. *)
external remove_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_size_group_remove_widget"

(** Gets the current mode of the size group. *)
external get_mode : t -> Gtk_enums.sizegroupmode = "ml_gtk_size_group_get_mode"

(** Adds a widget to a `GtkSizeGroup`.

In the future, the requisition
of the widget will be determined as the maximum of its requisition
and the requisition of the other widgets in the size group.
Whether this applies horizontally, vertically, or in both directions
depends on the mode of the size group.
See [method@Gtk.SizeGroup.set_mode].

When the widget is destroyed or no longer referenced elsewhere, it
will be removed from the size group. *)
external add_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_size_group_add_widget"

(* Properties *)

