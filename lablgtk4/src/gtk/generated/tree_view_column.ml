(* GENERATED CODE - DO NOT EDIT *)
(* TreeViewColumn: TreeViewColumn *)

type t = [`tree_view_column | `initially_unowned] Gobject.obj

(** Create a new TreeViewColumn *)
external new_ : unit -> t = "ml_gtk_tree_view_column_new"

(** Create a new TreeViewColumn *)
external new_with_area : Cell_area_and__cell_area_context.Cell_area.t -> t = "ml_gtk_tree_view_column_new_with_area"

(** Create a new TreeViewColumn *)
external new_with_attributes : string -> Cell_renderer.t -> unit -> t = "ml_gtk_tree_view_column_new_with_attributes"

(* Properties *)

(** Get property: alignment *)
external get_alignment : t -> float = "ml_gtk_tree_view_column_get_alignment"

(** Set property: alignment *)
external set_alignment : t -> float -> unit = "ml_gtk_tree_view_column_set_alignment"

(** Get property: clickable *)
external get_clickable : t -> bool = "ml_gtk_tree_view_column_get_clickable"

(** Set property: clickable *)
external set_clickable : t -> bool -> unit = "ml_gtk_tree_view_column_set_clickable"

(** Get property: expand *)
external get_expand : t -> bool = "ml_gtk_tree_view_column_get_expand"

(** Set property: expand *)
external set_expand : t -> bool -> unit = "ml_gtk_tree_view_column_set_expand"

(** Get property: fixed-width *)
external get_fixed_width : t -> int = "ml_gtk_tree_view_column_get_fixed_width"

(** Set property: fixed-width *)
external set_fixed_width : t -> int -> unit = "ml_gtk_tree_view_column_set_fixed_width"

(** Get property: max-width *)
external get_max_width : t -> int = "ml_gtk_tree_view_column_get_max_width"

(** Set property: max-width *)
external set_max_width : t -> int -> unit = "ml_gtk_tree_view_column_set_max_width"

(** Get property: min-width *)
external get_min_width : t -> int = "ml_gtk_tree_view_column_get_min_width"

(** Set property: min-width *)
external set_min_width : t -> int -> unit = "ml_gtk_tree_view_column_set_min_width"

(** Get property: reorderable *)
external get_reorderable : t -> bool = "ml_gtk_tree_view_column_get_reorderable"

(** Set property: reorderable *)
external set_reorderable : t -> bool -> unit = "ml_gtk_tree_view_column_set_reorderable"

(** Get property: resizable *)
external get_resizable : t -> bool = "ml_gtk_tree_view_column_get_resizable"

(** Set property: resizable *)
external set_resizable : t -> bool -> unit = "ml_gtk_tree_view_column_set_resizable"

(** Get property: sort-column-id *)
external get_sort_column_id : t -> int = "ml_gtk_tree_view_column_get_sort_column_id"

(** Set property: sort-column-id *)
external set_sort_column_id : t -> int -> unit = "ml_gtk_tree_view_column_set_sort_column_id"

(** Get property: sort-indicator *)
external get_sort_indicator : t -> bool = "ml_gtk_tree_view_column_get_sort_indicator"

(** Set property: sort-indicator *)
external set_sort_indicator : t -> bool -> unit = "ml_gtk_tree_view_column_set_sort_indicator"

(** Get property: spacing *)
external get_spacing : t -> int = "ml_gtk_tree_view_column_get_spacing"

(** Set property: spacing *)
external set_spacing : t -> int -> unit = "ml_gtk_tree_view_column_set_spacing"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_tree_view_column_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_tree_view_column_set_title"

(** Get property: visible *)
external get_visible : t -> bool = "ml_gtk_tree_view_column_get_visible"

(** Set property: visible *)
external set_visible : t -> bool -> unit = "ml_gtk_tree_view_column_set_visible"

(** Get property: width *)
external get_width : t -> int = "ml_gtk_tree_view_column_get_width"

(** Get property: x-offset *)
external get_x_offset : t -> int = "ml_gtk_tree_view_column_get_x_offset"

(** Sets the widget in the header to be @widget.  If widget is %NULL, then the
header button is set with a `GtkLabel` set to the title of @tree_column. *)
external set_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_tree_view_column_set_widget"

(** Changes the appearance of the sort indicator.

This does not actually sort the model.  Use
gtk_tree_view_column_set_sort_column_id() if you want automatic sorting
support.  This function is primarily for custom sorting behavior, and should
be used in conjunction with gtk_tree_sortable_set_sort_column_id() to do
that. For custom models, the mechanism will vary.

The sort indicator changes direction to indicate normal sort or reverse sort.
Note that you must have the sort indicator enabled to see anything when
calling this function; see gtk_tree_view_column_set_sort_indicator(). *)
external set_sort_order : t -> Gtk_enums.sorttype -> unit = "ml_gtk_tree_view_column_set_sort_order"

(** Sets the growth behavior of @tree_column to @type. *)
external set_sizing : t -> Gtk_enums.treeviewcolumnsizing -> unit = "ml_gtk_tree_view_column_set_sizing"

(** Flags the column, and the cell renderers added to this column, to have
their sizes renegotiated. *)
external queue_resize : t -> unit = "ml_gtk_tree_view_column_queue_resize"

(** Packs the @cell into the beginning of the column. If @expand is %FALSE, then
the @cell is allocated no more space than it needs. Any unused space is divided
evenly between cells for which @expand is %TRUE. *)
external pack_start : t -> Cell_renderer.t -> bool -> unit = "ml_gtk_tree_view_column_pack_start"

(** Adds the @cell to end of the column. If @expand is %FALSE, then the @cell
is allocated no more space than it needs. Any unused space is divided
evenly between cells for which @expand is %TRUE. *)
external pack_end : t -> Cell_renderer.t -> bool -> unit = "ml_gtk_tree_view_column_pack_end"

(** Returns the `GtkWidget` in the button on the column header.

If a custom widget has not been set then %NULL is returned. *)
external get_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_tree_view_column_get_widget"

(** Returns the `GtkTreeView` wherein @tree_column has been inserted.
If @column is currently not inserted in any tree view, %NULL is
returned. *)
external get_tree_view : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_tree_view_column_get_tree_view"

(** Gets the value set by gtk_tree_view_column_set_sort_order(). *)
external get_sort_order : t -> Gtk_enums.sorttype = "ml_gtk_tree_view_column_get_sort_order"

(** Returns the current type of @tree_column. *)
external get_sizing : t -> Gtk_enums.treeviewcolumnsizing = "ml_gtk_tree_view_column_get_sizing"

(** Returns the button used in the treeview column header *)
external get_button : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_tree_view_column_get_button"

(** Sets the current keyboard focus to be at @cell, if the column contains
2 or more editable and activatable cells. *)
external focus_cell : t -> Cell_renderer.t -> unit = "ml_gtk_tree_view_column_focus_cell"

(** Emits the “clicked” signal on the column.  This function will only work if
@tree_column is clickable. *)
external clicked : t -> unit = "ml_gtk_tree_view_column_clicked"

(** Clears all existing attributes previously set with
gtk_tree_view_column_set_attributes(). *)
external clear_attributes : t -> Cell_renderer.t -> unit = "ml_gtk_tree_view_column_clear_attributes"

(** Unsets all the mappings on all renderers on the @tree_column. *)
external clear : t -> unit = "ml_gtk_tree_view_column_clear"

(** Sets the cell renderer based on the @tree_model and @iter.  That is, for
every attribute mapping in @tree_column, it will get a value from the set
column on the @iter, and use that value to set the attribute on the cell
renderer.  This is used primarily by the `GtkTreeView`. *)
external cell_set_cell_data : t -> Tree_model.t -> Tree_iter.t -> bool -> bool -> unit = "ml_gtk_tree_view_column_cell_set_cell_data"

(** Returns %TRUE if any of the cells packed into the @tree_column are visible.
For this to be meaningful, you must first initialize the cells with
gtk_tree_view_column_cell_set_cell_data() *)
external cell_is_visible : t -> bool = "ml_gtk_tree_view_column_cell_is_visible"

(** Adds an attribute mapping to the list in @tree_column.

The @column is the
column of the model to get a value from, and the @attribute is the
parameter on @cell_renderer to be set from the value. So for example
if column 2 of the model contains strings, you could have the
“text” attribute of a `GtkCellRendererText` get its values from
column 2. *)
external add_attribute : t -> Cell_renderer.t -> string -> int -> unit = "ml_gtk_tree_view_column_add_attribute"

