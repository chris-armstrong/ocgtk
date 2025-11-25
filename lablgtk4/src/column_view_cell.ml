(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColumnViewCell *)

type t = Gtk.widget

(* Properties *)

(** Sets @self to be focusable.

If an item is focusable, it can be focused using the keyboard.
This works similar to [method@Gtk.Widget.set_focusable].

Note that if items are not focusable, the keyboard cannot be used to activate
them and selecting only works if one of the listitem's children is focusable.

By default, list items are focusable. *)
external set_focusable : t -> bool -> unit = "ml_gtk_column_view_cell_set_focusable"

(** Sets the child to be used for this listitem.

This function is typically called by applications when
setting up a listitem so that the widget can be reused when
binding it multiple times. *)
external set_child : t -> Gtk.widget option -> unit = "ml_gtk_column_view_cell_set_child"

(** Checks if the item is displayed as selected.

The selected state is maintained by the liste widget and its model
and cannot be set otherwise. *)
external get_selected : t -> bool = "ml_gtk_column_view_cell_get_selected"

(** Gets the position in the model that @self currently displays.

If @self is unbound, %GTK_INVALID_LIST_POSITION is returned. *)
external get_position : t -> int = "ml_gtk_column_view_cell_get_position"

(** Checks if a list item has been set to be focusable via
gtk_column_view_cell_set_focusable(). *)
external get_focusable : t -> bool = "ml_gtk_column_view_cell_get_focusable"

(** Gets the child previously set via gtk_column_view_cell_set_child() or
%NULL if none was set. *)
external get_child : t -> Gtk.widget = "ml_gtk_column_view_cell_get_child"

