(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ColumnViewRow *)

type t = Gtk.widget

(* Properties *)

(** Sets @self to be selectable.

If a row is selectable, clicking on the row or using the keyboard
will try to select or unselect the row. Whether this succeeds is up to
the model to determine, as it is managing the selected state.

Note that this means that making a row non-selectable has no
influence on the selected state at all. A non-selectable row
may still be selected.

By default, rows are selectable. *)
external set_selectable : t -> bool -> unit = "ml_gtk_column_view_row_set_selectable"

(** Sets @self to be focusable.

If a row is focusable, it can be focused using the keyboard.
This works similar to [method@Gtk.Widget.set_focusable].

Note that if row are not focusable, the contents of cells can still be focused if
they are focusable.

By default, rows are focusable. *)
external set_focusable : t -> bool -> unit = "ml_gtk_column_view_row_set_focusable"

(** Sets @self to be activatable.

If a row is activatable, double-clicking on the row, using
the Return key or calling gtk_widget_activate() will activate
the row. Activating instructs the containing columnview to
emit the [signal@Gtk.ColumnView::activate] signal.

By default, row are activatable. *)
external set_activatable : t -> bool -> unit = "ml_gtk_column_view_row_set_activatable"

(** Sets the accessible label for the row,
which may be used by e.g. screen readers. *)
external set_accessible_label : t -> string -> unit = "ml_gtk_column_view_row_set_accessible_label"

(** Sets the accessible description for the row,
which may be used by e.g. screen readers. *)
external set_accessible_description : t -> string -> unit = "ml_gtk_column_view_row_set_accessible_description"

(** Checks if the item is selected that this row corresponds to.

The selected state is maintained by the list widget and its model
and cannot be set otherwise. *)
external get_selected : t -> bool = "ml_gtk_column_view_row_get_selected"

(** Checks if the row has been set to be selectable via
gtk_column_view_row_set_selectable().

Do not confuse this function with [method@Gtk.ColumnViewRow.get_selected]. *)
external get_selectable : t -> bool = "ml_gtk_column_view_row_get_selectable"

(** Gets the position in the model that @self currently displays.

If @self is unbound, %GTK_INVALID_LIST_POSITION is returned. *)
external get_position : t -> int = "ml_gtk_column_view_row_get_position"

(** Checks if a row item has been set to be focusable via
gtk_column_view_row_set_focusable(). *)
external get_focusable : t -> bool = "ml_gtk_column_view_row_get_focusable"

(** Checks if the row has been set to be activatable via
gtk_column_view_row_set_activatable(). *)
external get_activatable : t -> bool = "ml_gtk_column_view_row_get_activatable"

(** Gets the accessible label of @self. *)
external get_accessible_label : t -> string = "ml_gtk_column_view_row_get_accessible_label"

(** Gets the accessible description of @self. *)
external get_accessible_description : t -> string = "ml_gtk_column_view_row_get_accessible_description"

