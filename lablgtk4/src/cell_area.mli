(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CellArea *)

type t = Gtk.widget

(* Properties *)

(** Explicitly stops the editing of the currently edited cell.

If @canceled is %TRUE, the currently edited cell renderer
will emit the ::editing-canceled signal, otherwise the
the ::editing-done signal will be emitted on the current
edit widget.

See gtk_cell_area_get_edited_cell() and gtk_cell_area_get_edit_widget(). *)
external stop_editing : t -> bool -> unit = "ml_gtk_cell_area_stop_editing"

(** Explicitly sets the currently focused cell to @renderer.

This is generally called by implementations of
`GtkCellAreaClass.focus()` or `GtkCellAreaClass.event()`,
however it can also be used to implement functions such
as gtk_tree_view_set_cursor_on_cell(). *)
external set_focus_cell : t -> Gtk.widget option -> unit = "ml_gtk_cell_area_set_focus_cell"

(** Removes @sibling from @renderer’s focus sibling list
(see gtk_cell_area_add_focus_sibling()). *)
external remove_focus_sibling : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_cell_area_remove_focus_sibling"

(** Removes @renderer from @area. *)
external remove : t -> Gtk.widget -> unit = "ml_gtk_cell_area_remove"

(** Returns whether @sibling is one of @renderer’s focus siblings
(see gtk_cell_area_add_focus_sibling()). *)
external is_focus_sibling : t -> Gtk.widget -> Gtk.widget -> bool = "ml_gtk_cell_area_is_focus_sibling"

(** Returns whether the area can do anything when activated,
after applying new attributes to @area. *)
external is_activatable : t -> bool = "ml_gtk_cell_area_is_activatable"

(** Checks if @area contains @renderer. *)
external has_renderer : t -> Gtk.widget -> bool = "ml_gtk_cell_area_has_renderer"

(** Gets whether the area prefers a height-for-width layout
or a width-for-height layout. *)
external get_request_mode : t -> Gtk_enums.sizerequestmode = "ml_gtk_cell_area_get_request_mode"

(** Gets the `GtkCellRenderer` which is expected to be focusable
for which @renderer is, or may be a sibling.

This is handy for `GtkCellArea` subclasses when handling events,
after determining the renderer at the event location it can
then chose to activate the focus cell for which the event
cell may have been a sibling. *)
external get_focus_from_sibling : t -> Gtk.widget -> Gtk.widget = "ml_gtk_cell_area_get_focus_from_sibling"

(** Retrieves the currently focused cell for @area *)
external get_focus_cell : t -> Gtk.widget = "ml_gtk_cell_area_get_focus_cell"

(** Gets the `GtkCellRenderer` in @area that is currently
being edited. *)
external get_edited_cell : t -> Gtk.widget = "ml_gtk_cell_area_get_edited_cell"

(** Gets the `GtkCellEditable` widget currently used
to edit the currently edited cell. *)
external get_edit_widget : t -> Gtk.widget = "ml_gtk_cell_area_get_edit_widget"

(** Gets the current `GtkTreePath` string for the currently
applied `GtkTreeIter`, this is implicitly updated when
gtk_cell_area_apply_attributes() is called and can be
used to interact with renderers from `GtkCellArea`
subclasses. *)
external get_current_path_string : t -> string = "ml_gtk_cell_area_get_current_path_string"

(** This should be called by the @area’s owning layout widget
when focus is to be passed to @area, or moved within @area
for a given @direction and row data.

Implementing `GtkCellArea` classes should implement this
method to receive and navigate focus in its own way particular
to how it lays out cells. *)
external focus : t -> Gtk_enums.directiontype -> bool = "ml_gtk_cell_area_focus"

(** Creates a `GtkCellArea`Context to be used with @area for
all purposes. `GtkCellArea`Context stores geometry information
for rows for which it was operated on, it is important to use
the same context for the same row of data at all times (i.e.
one should render and handle events with the same `GtkCellArea`Context
which was used to request the size of those rows of data). *)
external create_context : t -> Gtk.widget = "ml_gtk_cell_area_create_context"

(** This is sometimes needed for cases where rows need to share
alignments in one orientation but may be separately grouped
in the opposing orientation.

For instance, `GtkIconView` creates all icons (rows) to have
the same width and the cells theirin to have the same
horizontal alignments. However each row of icons may have
a separate collective height. `GtkIconView` uses this to
request the heights of each row based on a context which
was already used to request all the row widths that are
to be displayed. *)
external copy_context : t -> Gtk.widget -> Gtk.widget = "ml_gtk_cell_area_copy_context"

(** Returns the model column that an attribute has been mapped to,
or -1 if the attribute is not mapped. *)
external attribute_get_column : t -> Gtk.widget -> string -> int = "ml_gtk_cell_area_attribute_get_column"

(** Disconnects @attribute for the @renderer in @area so that
attribute will no longer be updated with values from the
model. *)
external attribute_disconnect : t -> Gtk.widget -> string -> unit = "ml_gtk_cell_area_attribute_disconnect"

(** Connects an @attribute to apply values from @column for the
`GtkTreeModel` in use. *)
external attribute_connect : t -> Gtk.widget -> string -> int -> unit = "ml_gtk_cell_area_attribute_connect"

(** Applies any connected attributes to the renderers in
@area by pulling the values from @tree_model. *)
external apply_attributes : t -> Gtk.widget -> Gtk.widget -> bool -> bool -> unit = "ml_gtk_cell_area_apply_attributes"

(** Adds @sibling to @renderer’s focusable area, focus will be drawn
around @renderer and all of its siblings if @renderer can
focus for a given row.

Events handled by focus siblings can also activate the given
focusable @renderer. *)
external add_focus_sibling : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_cell_area_add_focus_sibling"

(** Adds @renderer to @area with the default child cell properties. *)
external add : t -> Gtk.widget -> unit = "ml_gtk_cell_area_add"

