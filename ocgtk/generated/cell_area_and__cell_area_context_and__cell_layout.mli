(** The classes of {!Ocgtk.Cell_area}, {!Ocgtk.Cell_area_context},
    {!Ocgtk.Cell_layout}, defined together because they refer to each other.
    Each has a module of its own that re-exports it; use that module rather than
    this one. *)

(** The methods, signals and properties of a [GtkCellArea]. *)
class type cell_area_t = object
  inherit Buildable.buildable_t

  method on_focus_changed :
    ?after:bool ->
    callback:(renderer:Cell_renderer.cell_renderer_t -> path:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_remove_editable :
    ?after:bool ->
    callback:
      (renderer:Cell_renderer.cell_renderer_t ->
      editable:Cell_editable.cell_editable_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method activate :
    cell_area_context_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    bool ->
    bool
  (** Activates [area], usually by activating the currently focused cell,
      however some subclasses which embed widgets in the area can also activate
      a widget if it currently has the focus. *)

  method activate_cell :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Cell_renderer.cell_renderer_t ->
    Ocgdk.Event.event_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    bool
  (** This is used by [GtkCellArea] subclasses when handling events to activate
      cells, the base [GtkCellArea] class activates cells for keyboard events
      for free in its own GtkCellArea->activate() implementation. *)

  method add : Cell_renderer.cell_renderer_t -> unit
  (** Adds [renderer] to [area] with the default child cell properties. *)

  method add_focus_sibling :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t -> unit
  (** Adds [sibling] to [renderer]’s focusable area, focus will be drawn around
      [renderer] and all of its siblings if [renderer] can focus for a given
      row.

      Events handled by focus siblings can also activate the given focusable
      [renderer]. *)

  method apply_attributes :
    Tree_model.tree_model_t -> Raw.Tree_iter.t -> bool -> bool -> unit
  (** Applies any connected attributes to the renderers in [area] by pulling the
      values from [tree_model]. *)

  method attribute_connect :
    Cell_renderer.cell_renderer_t -> string -> int -> unit
  (** Connects an [attribute] to apply values from [column] for the
      [GtkTreeModel] in use. *)

  method attribute_disconnect : Cell_renderer.cell_renderer_t -> string -> unit
  (** Disconnects [attribute] for the [renderer] in [area] so that attribute
      will no longer be updated with values from the model. *)

  method attribute_get_column : Cell_renderer.cell_renderer_t -> string -> int
  (** Returns the model column that an attribute has been mapped to, or -1 if
      the attribute is not mapped. *)

  method cell_get_property :
    Cell_renderer.cell_renderer_t -> string -> Gobject.Value.t -> unit
  (** Gets the value of a cell property for [renderer] in [area]. *)

  method cell_set_property :
    Cell_renderer.cell_renderer_t -> string -> Gobject.Value.t -> unit
  (** Sets a cell property for [renderer] in [area]. *)

  method copy_context : cell_area_context_t -> cell_area_context_t
  (** This is sometimes needed for cases where rows need to share alignments in
      one orientation but may be separately grouped in the opposing orientation.

      For instance, [GtkIconView] creates all icons (rows) to have the same
      width and the cells theirin to have the same horizontal alignments.
      However each row of icons may have a separate collective height.
      [GtkIconView] uses this to request the heights of each row based on a
      context which was already used to request all the row widths that are to
      be displayed. *)

  method create_context : unit -> cell_area_context_t
  (** Creates a [GtkCellArea]Context to be used with [area] for all purposes.
      [GtkCellArea]Context stores geometry information for rows for which it was
      operated on, it is important to use the same context for the same row of
      data at all times (i.e. one should render and handle events with the same
      [GtkCellArea]Context which was used to request the size of those rows of
      data). *)

  method event :
    cell_area_context_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Ocgdk.Event.event_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    int
  (** Delegates event handling to a [GtkCellArea]. *)

  method focus : Enums.directiontype -> bool
  (** This should be called by the [area]’s owning layout widget when focus is
      to be passed to [area], or moved within [area] for a given [direction] and
      row data.

      Implementing [GtkCellArea] classes should implement this method to receive
      and navigate focus in its own way particular to how it lays out cells. *)

  method get_current_path_string : unit -> string
  (** Gets the current [GtkTreePath] string for the currently applied
      [GtkTreeIter], this is implicitly updated when
      gtk_cell_area_apply_attributes() is called and can be used to interact
      with renderers from [GtkCellArea] subclasses. *)

  method get_edit_widget : unit -> Cell_editable.cell_editable_t option
  (** Gets the [GtkCellEditable] widget currently used to edit the currently
      edited cell. *)

  method get_edited_cell : unit -> Cell_renderer.cell_renderer_t option
  (** Gets the [GtkCellRenderer] in [area] that is currently being edited. *)

  method get_focus_cell : unit -> Cell_renderer.cell_renderer_t option
  (** Retrieves the currently focused cell for [area] *)

  method get_focus_from_sibling :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t option
  (** Gets the [GtkCellRenderer] which is expected to be focusable for which
      [renderer] is, or may be a sibling.

      This is handy for [GtkCellArea] subclasses when handling events, after
      determining the renderer at the event location it can then chose to
      activate the focus cell for which the event cell may have been a sibling.
  *)

  method get_focus_siblings :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t list
  (** Gets the focus sibling cell renderers for [renderer]. *)

  method get_request_mode : unit -> Enums.sizerequestmode
  (** Gets whether the area prefers a height-for-width layout or a
      width-for-height layout. *)

  method has_renderer : Cell_renderer.cell_renderer_t -> bool
  (** Checks if [area] contains [renderer]. *)

  method is_activatable : unit -> bool
  (** Returns whether the area can do anything when activated, after applying
      new attributes to [area]. *)

  method is_focus_sibling :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t -> bool
  (** Returns whether [sibling] is one of [renderer]’s focus siblings (see
      gtk_cell_area_add_focus_sibling()). *)

  method remove : Cell_renderer.cell_renderer_t -> unit
  (** Removes [renderer] from [area]. *)

  method remove_focus_sibling :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t -> unit
  (** Removes [sibling] from [renderer]’s focus sibling list (see
      gtk_cell_area_add_focus_sibling()). *)

  method set_focus_cell : Cell_renderer.cell_renderer_t option -> unit
  (** Explicitly sets the currently focused cell to [renderer].

      This is generally called by implementations of [GtkCellAreaClass.focus()]
      or [GtkCellAreaClass.event()], however it can also be used to implement
      functions such as gtk_tree_view_set_cursor_on_cell(). *)

  method snapshot :
    cell_area_context_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Snapshot.snapshot_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    bool ->
    unit
  (** Snapshots [area]’s cells according to [area]’s layout onto at the given
      coordinates. *)

  method stop_editing : bool -> unit
  (** Explicitly stops the editing of the currently edited cell.

      If [canceled] is [TRUE], the currently edited cell renderer will emit the
      ::editing-canceled signal, otherwise the the ::editing-done signal will be
      emitted on the current edit widget.

      See gtk_cell_area_get_edited_cell() and gtk_cell_area_get_edit_widget().
  *)

  method as_cell_area : Raw.Cell_area.t
end

(** The methods, signals and properties of a [GtkCellAreaContext]. *)
and cell_area_context_t = object
  method allocate : int -> int -> unit
  (** Allocates a width and/or a height for all rows which are to be rendered
      with [context].

      Usually allocation is performed only horizontally or sometimes vertically
      since a group of rows are usually rendered side by side vertically or
      horizontally and share either the same width or the same height. Sometimes
      they are allocated in both horizontal and vertical orientations producing
      a homogeneous effect of the rows. This is generally the case for
      [GtkTreeView] when [GtkTreeView:fixed-height-mode] is enabled. *)

  method get_area : unit -> cell_area_t
  (** Fetches the [GtkCellArea] this [context] was created by.

      This is generally unneeded by layouting widgets; however, it is important
      for the context implementation itself to fetch information about the area
      it is being used for.

      For instance at [GtkCellAreaContextClass.allocate()] time it’s important
      to know details about any cell spacing that the [GtkCellArea] is
      configured with in order to compute a proper allocation. *)

  method push_preferred_height : int -> int -> unit
  (** Causes the minimum and/or natural height to grow if the new proposed sizes
      exceed the current minimum and natural height.

      This is used by [GtkCellAreaContext] implementations during the request
      process over a series of [GtkTreeModel] rows to progressively push the
      requested height over a series of gtk_cell_area_get_preferred_height()
      requests. *)

  method push_preferred_width : int -> int -> unit
  (** Causes the minimum and/or natural width to grow if the new proposed sizes
      exceed the current minimum and natural width.

      This is used by [GtkCellAreaContext] implementations during the request
      process over a series of [GtkTreeModel] rows to progressively push the
      requested width over a series of gtk_cell_area_get_preferred_width()
      requests. *)

  method reset : unit -> unit
  (** Resets any previously cached request and allocation data.

      When underlying [GtkTreeModel] data changes its important to reset the
      context if the content size is allowed to shrink. If the content size is
      only allowed to grow (this is usually an option for views rendering large
      data stores as a measure of optimization), then only the row that changed
      or was inserted needs to be (re)requested with
      gtk_cell_area_get_preferred_width().

      When the new overall size of the context requires that the allocated size
      changes (or whenever this allocation changes at all), the variable row
      sizes need to be re-requested for every row.

      For instance, if the rows are displayed all with the same width from top
      to bottom then a change in the allocated width necessitates a
      recalculation of all the displayed row heights using
      gtk_cell_area_get_preferred_height_for_width(). *)

  method minimum_height : int
  method minimum_width : int
  method natural_height : int
  method natural_width : int
  method as_cell_area_context : Raw.Cell_area_context.t
end

(** The methods, signals and properties of a [GtkCellLayout]. *)
and cell_layout_t = object
  method add_attribute : Cell_renderer.cell_renderer_t -> string -> int -> unit
  [@@ocaml.doc
    "Adds an attribute mapping to the list in [cell_layout].\n\n\
     The [column] is the column of the model to get a value from, and the\n\
     [attribute] is the property on [cell] to be set from that value. So for\n\
     example if column 2 of the model contains strings, you could have the\n\
     “text” attribute of a [GtkCellRendererText] get its values from column 2.\n\
     In this context \"attribute\" and \"property\" are used interchangeably."]

  method clear : unit -> unit
  (** Unsets all the mappings on all renderers on [cell_layout] and removes all
      renderers from [cell_layout]. *)

  method clear_attributes : Cell_renderer.cell_renderer_t -> unit
  (** Clears all existing attributes previously set with
      gtk_cell_layout_set_attributes(). *)

  method get_area : unit -> cell_area_t option
  (** Returns the underlying [GtkCellArea] which might be [cell_layout] if
      called on a [GtkCellArea] or might be [NULL] if no [GtkCellArea] is used
      by [cell_layout]. *)

  method get_cells : unit -> Cell_renderer.cell_renderer_t list
  (** Returns the cell renderers which have been added to [cell_layout]. *)

  method pack_end : Cell_renderer.cell_renderer_t -> bool -> unit
  (** Adds the [cell] to the end of [cell_layout]. If [expand] is [FALSE], then
      the [cell] is allocated no more space than it needs. Any unused space is
      divided evenly between cells for which [expand] is [TRUE].

      Note that reusing the same cell renderer is not supported. *)

  method pack_start : Cell_renderer.cell_renderer_t -> bool -> unit
  (** Packs the [cell] into the beginning of [cell_layout]. If [expand] is
      [FALSE], then the [cell] is allocated no more space than it needs. Any
      unused space is divided evenly between cells for which [expand] is [TRUE].

      Note that reusing the same cell renderer is not supported. *)

  method reorder : Cell_renderer.cell_renderer_t -> int -> unit
  (** Re-inserts [cell] at [position].

      Note that [cell] has already to be packed into [cell_layout] for this to
      function properly. *)

  method as_cell_layout : Raw.Cell_layout.t
end

(** Wraps a layer 1 handle, {!Ocgtk.Raw.Cell_area.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCellArea], give one already wrapped. *)
class cell_area : Raw.Cell_area.t -> cell_area_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Cell_area_context.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkCellAreaContext], give one already wrapped. *)

and cell_area_context : Raw.Cell_area_context.t -> cell_area_context_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Cell_layout.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCellLayout], give one already wrapped. *)

and cell_layout : Raw.Cell_layout.t -> cell_layout_t
