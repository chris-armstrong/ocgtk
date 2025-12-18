(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ListBox *)

type t = [`list_box | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new ListBox *)
external new_ : unit -> t = "ml_gtk_list_box_new"

(* Properties *)

(** Unselects a single row of @box, if the selection mode allows it. *)
external unselect_row : t -> List_box_row.t -> unit = "ml_gtk_list_box_unselect_row"

(** Unselect all children of @box, if the selection mode allows it. *)
external unselect_all : t -> unit = "ml_gtk_list_box_unselect_all"

(** Sets whether the list box should show separators
between rows. *)
external set_show_separators : t -> bool -> unit = "ml_gtk_list_box_set_show_separators"

(** Sets how selection works in the listbox. *)
external set_selection_mode : t -> Gtk_enums.selectionmode -> unit = "ml_gtk_list_box_set_selection_mode"

(** Sets the placeholder widget that is shown in the list when
it doesn't display any visible children. *)
external set_placeholder : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_list_box_set_placeholder"

(** Sets the adjustment (if any) that the widget uses to
for vertical scrolling.

For instance, this is used to get the page size for
PageUp/Down key handling.

In the normal case when the @box is packed inside
a `GtkScrolledWindow` the adjustment from that will
be picked up automatically, so there is no need
to manually do that. *)
external set_adjustment : t -> Adjustment.t option -> unit = "ml_gtk_list_box_set_adjustment"

(** If @single is %TRUE, rows will be activated when you click on them,
otherwise you need to double-click. *)
external set_activate_on_single_click : t -> bool -> unit = "ml_gtk_list_box_set_activate_on_single_click"

(** Make @row the currently selected row. *)
external select_row : t -> List_box_row.t option -> unit = "ml_gtk_list_box_select_row"

(** Select all children of @box, if the selection mode allows it. *)
external select_all : t -> unit = "ml_gtk_list_box_select_all"

(** Removes all rows from @box.

This function does nothing if @box is backed by a model. *)
external remove_all : t -> unit = "ml_gtk_list_box_remove_all"

(** Removes a child from @box. *)
external remove : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_list_box_remove"

(** Prepend a widget to the list.

If a sort function is set, the widget will
actually be inserted at the calculated position. *)
external prepend : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_list_box_prepend"

(** Update the sorting for all rows.

Call this when result
of the sort function on the @box is changed due
to an external factor. *)
external invalidate_sort : t -> unit = "ml_gtk_list_box_invalidate_sort"

(** Update the separators for all rows.

Call this when result
of the header function on the @box is changed due
to an external factor. *)
external invalidate_headers : t -> unit = "ml_gtk_list_box_invalidate_headers"

(** Update the filtering for all rows.

Call this when result
of the filter function on the @box is changed due
to an external factor. For instance, this would be used
if the filter function just looked for a specific search
string and the entry with the search string has changed. *)
external invalidate_filter : t -> unit = "ml_gtk_list_box_invalidate_filter"

(** Insert the @child into the @box at @position.

If a sort function is
set, the widget will actually be inserted at the calculated position.

If @position is -1, or larger than the total number of items in the
@box, then the @child will be appended to the end. *)
external insert : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> int -> unit = "ml_gtk_list_box_insert"

(** Returns whether the list box should show separators
between rows. *)
external get_show_separators : t -> bool = "ml_gtk_list_box_get_show_separators"

(** Gets the selection mode of the listbox. *)
external get_selection_mode : t -> Gtk_enums.selectionmode = "ml_gtk_list_box_get_selection_mode"

(** Gets the selected row, or %NULL if no rows are selected.

Note that the box may allow multiple selection, in which
case you should use [method@Gtk.ListBox.selected_foreach] to
find all selected rows. *)
external get_selected_row : t -> List_box_row.t option = "ml_gtk_list_box_get_selected_row"

(** Gets the row at the @y position. *)
external get_row_at_y : t -> int -> List_box_row.t option = "ml_gtk_list_box_get_row_at_y"

(** Gets the n-th child in the list (not counting headers).

If @index_ is negative or larger than the number of items in the
list, %NULL is returned. *)
external get_row_at_index : t -> int -> List_box_row.t option = "ml_gtk_list_box_get_row_at_index"

(** Gets the adjustment (if any) that the widget uses to
for vertical scrolling. *)
external get_adjustment : t -> Adjustment.t option = "ml_gtk_list_box_get_adjustment"

(** Returns whether rows activate on single clicks. *)
external get_activate_on_single_click : t -> bool = "ml_gtk_list_box_get_activate_on_single_click"

(** If a row has previously been highlighted via gtk_list_box_drag_highlight_row(),
it will have the highlight removed. *)
external drag_unhighlight_row : t -> unit = "ml_gtk_list_box_drag_unhighlight_row"

(** Add a drag highlight to a row.

This is a helper function for implementing DnD onto a `GtkListBox`.
The passed in @row will be highlighted by setting the
%GTK_STATE_FLAG_DROP_ACTIVE state and any previously highlighted
row will be unhighlighted.

The row will also be unhighlighted when the widget gets
a drag leave event. *)
external drag_highlight_row : t -> List_box_row.t -> unit = "ml_gtk_list_box_drag_highlight_row"

(** Append a widget to the list.

If a sort function is set, the widget will
actually be inserted at the calculated position. *)
external append : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> unit = "ml_gtk_list_box_append"

