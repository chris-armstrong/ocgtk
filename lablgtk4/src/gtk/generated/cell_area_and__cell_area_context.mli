(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec Cell_area : sig
  type t = [`cell_area | `initially_unowned] Gobject.obj

  (* Methods *)
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
  external set_focus_cell : t -> Cell_renderer.t option -> unit = "ml_gtk_cell_area_set_focus_cell"

  (** This is a convenience function for `GtkCellArea` implementations
  to request size for cell renderers. It’s important to use this
  function to request size and then use gtk_cell_area_inner_cell_area()
  at render and event time since this function will add padding
  around the cell for focus painting. *)
  external request_renderer : t -> Cell_renderer.t -> Gtk_enums.orientation -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> int -> int * int = "ml_gtk_cell_area_request_renderer_bytecode" "ml_gtk_cell_area_request_renderer_native"

  (** Removes @sibling from @renderer’s focus sibling list
  (see gtk_cell_area_add_focus_sibling()). *)
  external remove_focus_sibling : t -> Cell_renderer.t -> Cell_renderer.t -> unit = "ml_gtk_cell_area_remove_focus_sibling"

  (** Removes @renderer from @area. *)
  external remove : t -> Cell_renderer.t -> unit = "ml_gtk_cell_area_remove"

  (** Returns whether @sibling is one of @renderer’s focus siblings
  (see gtk_cell_area_add_focus_sibling()). *)
  external is_focus_sibling : t -> Cell_renderer.t -> Cell_renderer.t -> bool = "ml_gtk_cell_area_is_focus_sibling"

  (** Returns whether the area can do anything when activated,
  after applying new attributes to @area. *)
  external is_activatable : t -> bool = "ml_gtk_cell_area_is_activatable"

  (** Checks if @area contains @renderer. *)
  external has_renderer : t -> Cell_renderer.t -> bool = "ml_gtk_cell_area_has_renderer"

  (** Gets whether the area prefers a height-for-width layout
  or a width-for-height layout. *)
  external get_request_mode : t -> Gtk_enums.sizerequestmode = "ml_gtk_cell_area_get_request_mode"

  (** Retrieves a cell area’s minimum and natural width if it would be given
  the specified @height.

  @area stores some geometrical information in @context along the way
  while calling gtk_cell_area_get_preferred_height(). It’s important to
  perform a series of gtk_cell_area_get_preferred_height() requests with
  @context first and then call gtk_cell_area_get_preferred_width_for_height()
  on each cell area individually to get the height for width of each
  fully requested row.

  If at some point, the height of a single row changes, it should be
  requested with gtk_cell_area_get_preferred_height() again and then
  the full height of the requested rows checked again with
  gtk_cell_area_context_get_preferred_height(). *)
  external get_preferred_width_for_height : t -> Cell_area_context.t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> int -> int * int = "ml_gtk_cell_area_get_preferred_width_for_height_bytecode" "ml_gtk_cell_area_get_preferred_width_for_height_native"

  (** Retrieves a cell area’s initial minimum and natural width.

  @area will store some geometrical information in @context along the way;
  when requesting sizes over an arbitrary number of rows, it’s not important
  to check the @minimum_width and @natural_width of this call but rather to
  consult gtk_cell_area_context_get_preferred_width() after a series of
  requests. *)
  external get_preferred_width : t -> Cell_area_context.t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> int * int = "ml_gtk_cell_area_get_preferred_width"

  (** Retrieves a cell area’s minimum and natural height if it would be given
  the specified @width.

  @area stores some geometrical information in @context along the way
  while calling gtk_cell_area_get_preferred_width(). It’s important to
  perform a series of gtk_cell_area_get_preferred_width() requests with
  @context first and then call gtk_cell_area_get_preferred_height_for_width()
  on each cell area individually to get the height for width of each
  fully requested row.

  If at some point, the width of a single row changes, it should be
  requested with gtk_cell_area_get_preferred_width() again and then
  the full width of the requested rows checked again with
  gtk_cell_area_context_get_preferred_width(). *)
  external get_preferred_height_for_width : t -> Cell_area_context.t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> int -> int * int = "ml_gtk_cell_area_get_preferred_height_for_width_bytecode" "ml_gtk_cell_area_get_preferred_height_for_width_native"

  (** Retrieves a cell area’s initial minimum and natural height.

  @area will store some geometrical information in @context along the way;
  when requesting sizes over an arbitrary number of rows, it’s not important
  to check the @minimum_height and @natural_height of this call but rather to
  consult gtk_cell_area_context_get_preferred_height() after a series of
  requests. *)
  external get_preferred_height : t -> Cell_area_context.t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> int * int = "ml_gtk_cell_area_get_preferred_height"

  (** Gets the `GtkCellRenderer` which is expected to be focusable
  for which @renderer is, or may be a sibling.

  This is handy for `GtkCellArea` subclasses when handling events,
  after determining the renderer at the event location it can
  then chose to activate the focus cell for which the event
  cell may have been a sibling. *)
  external get_focus_from_sibling : t -> Cell_renderer.t -> Cell_renderer.t option = "ml_gtk_cell_area_get_focus_from_sibling"

  (** Retrieves the currently focused cell for @area *)
  external get_focus_cell : t -> Cell_renderer.t option = "ml_gtk_cell_area_get_focus_cell"

  (** Gets the `GtkCellRenderer` in @area that is currently
  being edited. *)
  external get_edited_cell : t -> Cell_renderer.t option = "ml_gtk_cell_area_get_edited_cell"

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
  external create_context : t -> Cell_area_context.t = "ml_gtk_cell_area_create_context"

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
  external copy_context : t -> Cell_area_context.t -> Cell_area_context.t = "ml_gtk_cell_area_copy_context"

  (** Returns the model column that an attribute has been mapped to,
  or -1 if the attribute is not mapped. *)
  external attribute_get_column : t -> Cell_renderer.t -> string -> int = "ml_gtk_cell_area_attribute_get_column"

  (** Disconnects @attribute for the @renderer in @area so that
  attribute will no longer be updated with values from the
  model. *)
  external attribute_disconnect : t -> Cell_renderer.t -> string -> unit = "ml_gtk_cell_area_attribute_disconnect"

  (** Connects an @attribute to apply values from @column for the
  `GtkTreeModel` in use. *)
  external attribute_connect : t -> Cell_renderer.t -> string -> int -> unit = "ml_gtk_cell_area_attribute_connect"

  (** Adds @sibling to @renderer’s focusable area, focus will be drawn
  around @renderer and all of its siblings if @renderer can
  focus for a given row.

  Events handled by focus siblings can also activate the given
  focusable @renderer. *)
  external add_focus_sibling : t -> Cell_renderer.t -> Cell_renderer.t -> unit = "ml_gtk_cell_area_add_focus_sibling"

  (** Adds @renderer to @area with the default child cell properties. *)
  external add : t -> Cell_renderer.t -> unit = "ml_gtk_cell_area_add"

  (* Properties *)


end

and Cell_area_context
 : sig
  type t = [`cell_area_context | `object_] Gobject.obj

  (* Methods *)
  (** Resets any previously cached request and allocation
  data.

  When underlying `GtkTreeModel` data changes its
  important to reset the context if the content
  size is allowed to shrink. If the content size
  is only allowed to grow (this is usually an option
  for views rendering large data stores as a measure
  of optimization), then only the row that changed
  or was inserted needs to be (re)requested with
  gtk_cell_area_get_preferred_width().

  When the new overall size of the context requires
  that the allocated size changes (or whenever this
  allocation changes at all), the variable row
  sizes need to be re-requested for every row.

  For instance, if the rows are displayed all with
  the same width from top to bottom then a change
  in the allocated width necessitates a recalculation
  of all the displayed row heights using
  gtk_cell_area_get_preferred_height_for_width(). *)
  external reset : t -> unit = "ml_gtk_cell_area_context_reset"

  (** Causes the minimum and/or natural width to grow if the new
  proposed sizes exceed the current minimum and natural width.

  This is used by `GtkCellAreaContext` implementations during
  the request process over a series of `GtkTreeModel` rows to
  progressively push the requested width over a series of
  gtk_cell_area_get_preferred_width() requests. *)
  external push_preferred_width : t -> int -> int -> unit = "ml_gtk_cell_area_context_push_preferred_width"

  (** Causes the minimum and/or natural height to grow if the new
  proposed sizes exceed the current minimum and natural height.

  This is used by `GtkCellAreaContext` implementations during
  the request process over a series of `GtkTreeModel` rows to
  progressively push the requested height over a series of
  gtk_cell_area_get_preferred_height() requests. *)
  external push_preferred_height : t -> int -> int -> unit = "ml_gtk_cell_area_context_push_preferred_height"

  (** Gets the accumulative preferred width for @height for all rows which
  have been requested for the same said @height with this context.

  After gtk_cell_area_context_reset() is called and/or before ever
  requesting the size of a `GtkCellArea`, the returned values are -1. *)
  external get_preferred_width_for_height : t -> int -> int * int = "ml_gtk_cell_area_context_get_preferred_width_for_height"

  (** Gets the accumulative preferred width for all rows which have been
  requested with this context.

  After gtk_cell_area_context_reset() is called and/or before ever
  requesting the size of a `GtkCellArea`, the returned values are 0. *)
  external get_preferred_width : t -> int * int = "ml_gtk_cell_area_context_get_preferred_width"

  (** Gets the accumulative preferred height for @width for all rows
  which have been requested for the same said @width with this context.

  After gtk_cell_area_context_reset() is called and/or before ever
  requesting the size of a `GtkCellArea`, the returned values are -1. *)
  external get_preferred_height_for_width : t -> int -> int * int = "ml_gtk_cell_area_context_get_preferred_height_for_width"

  (** Gets the accumulative preferred height for all rows which have been
  requested with this context.

  After gtk_cell_area_context_reset() is called and/or before ever
  requesting the size of a `GtkCellArea`, the returned values are 0. *)
  external get_preferred_height : t -> int * int = "ml_gtk_cell_area_context_get_preferred_height"

  (** Fetches the `GtkCellArea` this @context was created by.

  This is generally unneeded by layouting widgets; however,
  it is important for the context implementation itself to
  fetch information about the area it is being used for.

  For instance at `GtkCellAreaContextClass.allocate()` time
  it’s important to know details about any cell spacing
  that the `GtkCellArea` is configured with in order to
  compute a proper allocation. *)
  external get_area : t -> Cell_area.t = "ml_gtk_cell_area_context_get_area"

  (** Fetches the current allocation size for @context.

  If the context was not allocated in width or height, or if the
  context was recently reset with gtk_cell_area_context_reset(),
  the returned value will be -1. *)
  external get_allocation : t -> int * int = "ml_gtk_cell_area_context_get_allocation"

  (** Allocates a width and/or a height for all rows which are to be
  rendered with @context.

  Usually allocation is performed only horizontally or sometimes
  vertically since a group of rows are usually rendered side by
  side vertically or horizontally and share either the same width
  or the same height. Sometimes they are allocated in both horizontal
  and vertical orientations producing a homogeneous effect of the
  rows. This is generally the case for `GtkTreeView` when
  `GtkTreeView:fixed-height-mode` is enabled. *)
  external allocate : t -> int -> int -> unit = "ml_gtk_cell_area_context_allocate"

  (* Properties *)

  (** Get property: minimum-height *)
  external get_minimum_height : t -> int = "ml_gtk_cell_area_context_get_minimum_height"

  (** Get property: minimum-width *)
  external get_minimum_width : t -> int = "ml_gtk_cell_area_context_get_minimum_width"

  (** Get property: natural-height *)
  external get_natural_height : t -> int = "ml_gtk_cell_area_context_get_natural_height"

  (** Get property: natural-width *)
  external get_natural_width : t -> int = "ml_gtk_cell_area_context_get_natural_width"


end
