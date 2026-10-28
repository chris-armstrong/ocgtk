(** The classes of {!Ocgtk.Cell_area}, {!Ocgtk.Cell_area_context},
    {!Ocgtk.Cell_layout}, defined together because they refer to each other.
    Each has a module of its own that re-exports it; use that module rather than
    this one. *)

class type cell_area_t = object
  inherit Buildable.buildable_t

  (** {2:signals Signals} *)

  method on_focus_changed :
    ?after:bool ->
    callback:(renderer:Cell_renderer.cell_renderer_t -> path:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Indicates that focus changed on this [area]. This signal is emitted either
      as a result of focus handling or event handling.

      It's possible that the signal is emitted even if the currently focused
      renderer did not change, this is because focus may change to the same
      renderer in the same cell area for a different row of data. *)

  method on_remove_editable :
    ?after:bool ->
    callback:
      (renderer:Cell_renderer.cell_renderer_t ->
      editable:Cell_editable.cell_editable_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Indicates that editing finished on [renderer] and that [editable] should
      be removed from the owning cell-layouting widget. *)

  (** {2:methods Methods} *)

  method activate :
    cell_area_context_t ->
    Widget.widget_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    bool ->
    bool
  (** Activates [area], usually by activating the currently focused cell,
      however some subclasses which embed widgets in the area can also activate
      a widget if it currently has the focus. *)

  method activate_cell :
    Widget.widget_t ->
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
    Widget.widget_t ->
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
    Widget.widget_t ->
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

  (** {2:conversions Conversions} *)

  method as_cell_area : Raw.Cell_area.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [CellArea].}\n\n\
     Inherits from: [GObject.InitiallyUnowned]\n\n\
     Implements:\n\
     - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}\n\
     - {{!Ocgtk.Cell_layout.class-type-cell_layout_t}Ocgtk.Cell_layout}\n\n\
     An abstract class for laying out [GtkCellRenderer]s\n\n\
     The [GtkCellArea] is an abstract class for [Gtk.CellLayout]\n\
     widgets (also referred to as \"layouting widgets\") to interface with\n\
     an arbitrary number of [Gtk.CellRenderer]s and interact with the user\n\
     for a given [Gtk.TreeModel] row.\n\n\
     The cell area handles events, focus navigation, drawing and\n\
     size requests and allocations for a given row of data.\n\n\
     Usually users dont have to interact with the [GtkCellArea] directly\n\
     unless they are implementing a cell-layouting widget themselves.\n\n\
     {b Requesting area sizes}\n\n\
     As outlined in\n\
     GtkWidget’s geometry management section,\n\
     GTK uses a height-for-width\n\
     geometry management system to compute the sizes of widgets and user\n\
     interfaces. [GtkCellArea] uses the same semantics to calculate the\n\
     size of an area for an arbitrary number of [GtkTreeModel] rows.\n\n\
     When requesting the size of a cell area one needs to calculate\n\
     the size for a handful of rows, and this will be done differently by\n\
     different layouting widgets. For instance a [Gtk.TreeViewColumn]\n\
     always lines up the areas from top to bottom while a [Gtk.IconView]\n\
     on the other hand might enforce that all areas received the same\n\
     width and wrap the areas around, requesting height for more cell\n\
     areas when allocated less width.\n\n\
     It’s also important for areas to maintain some cell\n\
     alignments with areas rendered for adjacent rows (cells can\n\
     appear “columnized” inside an area even when the size of\n\
     cells are different in each row). For this reason the [GtkCellArea]\n\
     uses a [Gtk.CellAreaContext] object to store the alignments\n\
     and sizes along the way (as well as the overall largest minimum\n\
     and natural size for all the rows which have been calculated\n\
     with the said context).\n\n\
     The [Gtk.CellAreaContext] is an opaque object specific to the\n\
     [GtkCellArea] which created it (see [Gtk.CellArea.create_context]).\n\n\
     The owning cell-layouting widget can create as many contexts as\n\
     it wishes to calculate sizes of rows which should receive the\n\
     same size in at least one orientation (horizontally or vertically),\n\
     However, it’s important that the same [Gtk.CellAreaContext] which\n\
     was used to request the sizes for a given [GtkTreeModel] row be\n\
     used when rendering or processing events for that row.\n\n\
     In order to request the width of all the rows at the root level\n\
     of a [GtkTreeModel] one would do the following:\n\n\
     {[\n\
     GtkTreeIter iter;\n\
     int minimum_width;\n\
     int natural_width;\n\n\
     valid = gtk_tree_model_get_iter_first (model, &iter);\n\
     while (valid)\n\
    \  {\n\
    \    gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);\n\
    \    gtk_cell_area_get_preferred_width (area, context, widget, NULL, \
     NULL);\n\n\
    \    valid = gtk_tree_model_iter_next (model, &iter);\n\
    \  }\n\n\
     gtk_cell_area_context_get_preferred_width (context, &minimum_width, \
     &natural_width);\n\
     ]}\n\n\
     Note that in this example it’s not important to observe the\n\
     returned minimum and natural width of the area for each row\n\
     unless the cell-layouting object is actually interested in the\n\
     widths of individual rows. The overall width is however stored\n\
     in the accompanying [GtkCellAreaContext] object and can be consulted\n\
     at any time.\n\n\
     This can be useful since [GtkCellLayout] widgets usually have to\n\
     support requesting and rendering rows in treemodels with an\n\
     exceedingly large amount of rows. The [GtkCellLayout] widget in\n\
     that case would calculate the required width of the rows in an\n\
     idle or timeout source (see [GLib.timeout_add]) and when the widget\n\
     is requested its actual width in [Gtk.Widget.measure]\n\
     it can simply consult the width accumulated so far in the\n\
     [GtkCellAreaContext] object.\n\n\
     A simple example where rows are rendered from top to bottom and\n\
     take up the full width of the layouting widget would look like:\n\n\
     {[\n\
     static void\n\
     foo_get_preferred_width (GtkWidget *widget,\n\
    \                         int       *minimum_size,\n\
    \                         int       *natural_size)\n\
     {\n\
    \  Foo *self = FOO (widget);\n\
    \  FooPrivate *priv = foo_get_instance_private (self);\n\n\
    \  foo_ensure_at_least_one_handfull_of_rows_have_been_requested (self);\n\n\
    \  gtk_cell_area_context_get_preferred_width (priv->context, minimum_size, \
     natural_size);\n\
     }\n\
     ]}\n\n\
     In the above example the [Foo] widget has to make sure that some\n\
     row sizes have been calculated (the amount of rows that [Foo] judged\n\
     was appropriate to request space for in a single timeout iteration)\n\
     before simply returning the amount of space required by the area via\n\
     the [GtkCellAreaContext].\n\n\
     Requesting the height for width (or width for height) of an area is\n\
     a similar task except in this case the [GtkCellAreaContext] does not\n\
     store the data (actually, it does not know how much space the layouting\n\
     widget plans to allocate it for every row. It’s up to the layouting\n\
     widget to render each row of data with the appropriate height and\n\
     width which was requested by the [GtkCellArea]).\n\n\
     In order to request the height for width of all the rows at the\n\
     root level of a [GtkTreeModel] one would do the following:\n\n\
     {[\n\
     GtkTreeIter iter;\n\
     int minimum_height;\n\
     int natural_height;\n\
     int full_minimum_height = 0;\n\
     int full_natural_height = 0;\n\n\
     valid = gtk_tree_model_get_iter_first (model, &iter);\n\
     while (valid)\n\
    \  {\n\
    \    gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);\n\
    \    gtk_cell_area_get_preferred_height_for_width (area, context, widget,\n\
    \                                                  width, &minimum_height, \
     &natural_height);\n\n\
    \    if (width_is_for_allocation)\n\
    \       cache_row_height (&iter, minimum_height, natural_height);\n\n\
    \    full_minimum_height += minimum_height;\n\
    \    full_natural_height += natural_height;\n\n\
    \    valid = gtk_tree_model_iter_next (model, &iter);\n\
    \  }\n\
     ]}\n\n\
     Note that in the above example we would need to cache the heights\n\
     returned for each row so that we would know what sizes to render the\n\
     areas for each row. However we would only want to really cache the\n\
     heights if the request is intended for the layouting widgets real\n\
     allocation.\n\n\
     In some cases the layouting widget is requested the height for an\n\
     arbitrary for_width, this is a special case for layouting widgets\n\
     who need to request size for tens of thousands  of rows. For this\n\
     case it’s only important that the layouting widget calculate\n\
     one reasonably sized chunk of rows and return that height\n\
     synchronously. The reasoning here is that any layouting widget is\n\
     at least capable of synchronously calculating enough height to fill\n\
     the screen height (or scrolled window height) in response to a single\n\
     call to [Gtk.Widget.measure]. Returning\n\
     a perfect height for width that is larger than the screen area is\n\
     inconsequential since after the layouting receives an allocation\n\
     from a scrolled window it simply continues to drive the scrollbar\n\
     values while more and more height is required for the row heights\n\
     that are calculated in the background.\n\n\
     {b Rendering Areas}\n\n\
     Once area sizes have been acquired at least for the rows in the\n\
     visible area of the layouting widget they can be rendered at\n\
     [Gtk.Widget.snapshot] time.\n\n\
     A crude example of how to render all the rows at the root level\n\
     runs as follows:\n\n\
     {[\n\
     GtkAllocation allocation;\n\
     GdkRectangle cell_area = { 0, };\n\
     GtkTreeIter iter;\n\
     int minimum_width;\n\
     int natural_width;\n\n\
     gtk_widget_get_allocation (widget, &allocation);\n\
     cell_area.width = allocation.width;\n\n\
     valid = gtk_tree_model_get_iter_first (model, &iter);\n\
     while (valid)\n\
    \  {\n\
    \    cell_area.height = get_cached_height_for_row (&iter);\n\n\
    \    gtk_cell_area_apply_attributes (area, model, &iter, FALSE, FALSE);\n\
    \    gtk_cell_area_render (area, context, widget, cr,\n\
    \                          &cell_area, &cell_area, state_flags, FALSE);\n\n\
    \    cell_area.y += cell_area.height;\n\n\
    \    valid = gtk_tree_model_iter_next (model, &iter);\n\
    \  }\n\
     ]}\n\n\
     Note that the cached height in this example really depends on how\n\
     the layouting widget works. The layouting widget might decide to\n\
     give every row its minimum or natural height or, if the model content\n\
     is expected to fit inside the layouting widget without scrolling, it\n\
     would make sense to calculate the allocation for each row at\n\
     the time the widget is allocated using \
     [Gtk.distribute_natural_allocation].\n\n\
     {b Handling Events and Driving Keyboard Focus}\n\n\
     Passing events to the area is as simple as handling events on any\n\
     normal widget and then passing them to the [Gtk.CellArea.event]\n\
     API as they come in. Usually [GtkCellArea] is only interested in\n\
     button events, however some customized derived areas can be implemented\n\
     who are interested in handling other events. Handling an event can\n\
     trigger the [Gtk.CellArea::focus-changed] signal to fire; as well\n\
     as [Gtk.CellArea::add-editable] in the case that an editable cell\n\
     was clicked and needs to start editing. You can call\n\
     [Gtk.CellArea.stop_editing] at any time to cancel any cell editing\n\
     that is currently in progress.\n\n\
     The [GtkCellArea] drives keyboard focus from cell to cell in a way\n\
     similar to [GtkWidget]. For layouting widgets that support giving\n\
     focus to cells it’s important to remember to pass \
     [GTK_CELL_RENDERER_FOCUSED]\n\
     to the area functions for the row that has focus and to tell the\n\
     area to paint the focus at render time.\n\n\
     Layouting widgets that accept focus on cells should implement the\n\
     [Gtk.Widget.focus] virtual method. The layouting widget is always\n\
     responsible for knowing where [GtkTreeModel] rows are rendered inside\n\
     the widget, so at [Gtk.Widget.focus] time the layouting widget\n\
     should use the [GtkCellArea] methods to navigate focus inside the area\n\
     and then observe the [Gtk.DirectionType] to pass the focus to adjacent\n\
     rows and areas.\n\n\
     A basic example of how the [Gtk.Widget.focus] virtual method\n\
     should be implemented:\n\n\
     {[\n\
     static gboolean\n\
     foo_focus (GtkWidget       *widget,\n\
    \           GtkDirectionType direction)\n\
     {\n\
    \  Foo *self = FOO (widget);\n\
    \  FooPrivate *priv = foo_get_instance_private (self);\n\
    \  int focus_row = priv->focus_row;\n\
    \  gboolean have_focus = FALSE;\n\n\
    \  if (!gtk_widget_has_focus (widget))\n\
    \    gtk_widget_grab_focus (widget);\n\n\
    \  valid = gtk_tree_model_iter_nth_child (priv->model, &iter, NULL, \
     priv->focus_row);\n\
    \  while (valid)\n\
    \    {\n\
    \      gtk_cell_area_apply_attributes (priv->area, priv->model, &iter, \
     FALSE, FALSE);\n\n\
    \      if (gtk_cell_area_focus (priv->area, direction))\n\
    \        {\n\
    \           priv->focus_row = focus_row;\n\
    \           have_focus = TRUE;\n\
    \           break;\n\
    \        }\n\
    \      else\n\
    \        {\n\
    \          if (direction == GTK_DIR_RIGHT ||\n\
    \              direction == GTK_DIR_LEFT)\n\
    \            break;\n\
    \          else if (direction == GTK_DIR_UP ||\n\
    \                   direction == GTK_DIR_TAB_BACKWARD)\n\
    \           {\n\
    \              if (focus_row == 0)\n\
    \                break;\n\
    \              else\n\
    \               {\n\
    \                  focus_row--;\n\
    \                  valid = gtk_tree_model_iter_nth_child (priv->model, \
     &iter, NULL, focus_row);\n\
    \               }\n\
    \            }\n\
    \          else\n\
    \            {\n\
    \              if (focus_row == last_row)\n\
    \                break;\n\
    \              else\n\
    \                {\n\
    \                  focus_row++;\n\
    \                  valid = gtk_tree_model_iter_next (priv->model, &iter);\n\
    \                }\n\
    \            }\n\
    \        }\n\
    \    }\n\
    \    return have_focus;\n\
     }\n\
     ]}\n\n\
     Note that the layouting widget is responsible for matching the\n\
     [GtkDirectionType] values to the way it lays out its cells.\n\n\
     {b Cell Properties}\n\n\
     The [GtkCellArea] introduces cell properties for [GtkCellRenderer]s.\n\
     This provides some general interfaces for defining the relationship\n\
     cell areas have with their cells. For instance in a [Gtk.CellAreaBox]\n\
     a cell might “expand” and receive extra space when the area is allocated\n\
     more than its full natural request, or a cell might be configured to \
     “align”\n\
     with adjacent rows which were requested and rendered with the same\n\
     [GtkCellAreaContext].\n\n\
     Use [Gtk.CellAreaClass.install_cell_property] to install cell\n\
     properties for a cell area class and [Gtk.CellAreaClass.find_cell_property]\n\
     or [Gtk.CellAreaClass.list_cell_properties] to get information about\n\
     existing cell properties.\n\n\
     To set the value of a cell property, use [Gtk.CellArea.cell_set_property],\n\
     [Gtk.CellArea.cell_set] or [Gtk.CellArea.cell_set_valist]. To obtain\n\
     the value of a cell property, use [Gtk.CellArea.cell_get_property]\n\
     [Gtk.CellArea.cell_get] or [Gtk.CellArea.cell_get_valist]."]

(** {b The methods, signals and properties of a [CellAreaContext].}

    Stores geometrical information for a series of rows in a GtkCellArea

    The [GtkCellAreaContext] object is created by a given [GtkCellArea]
    implementation via its [GtkCellAreaClass.create_context()] virtual method
    and is used to store cell sizes and alignments for a series of
    [GtkTreeModel] rows that are requested and rendered in the same context.

    [GtkCellLayout] widgets can create any number of contexts in which to
    request and render groups of data rows. However, it’s important that the
    same context which was used to request sizes for a given [GtkTreeModel] row
    also be used for the same row when calling other [GtkCellArea] APIs such as
    gtk_cell_area_render() and gtk_cell_area_event(). *)
and cell_area_context_t = object
  (** {2:methods Methods} *)

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

  (** {2:properties Properties} *)

  method minimum_height : int
  (** The minimum height for the [GtkCellArea] in this context for all
      [GtkTreeModel] rows that this context was requested for using
      gtk_cell_area_get_preferred_height(). *)

  method minimum_width : int
  (** The minimum width for the [GtkCellArea] in this context for all
      [GtkTreeModel] rows that this context was requested for using
      gtk_cell_area_get_preferred_width(). *)

  method natural_height : int
  (** The natural height for the [GtkCellArea] in this context for all
      [GtkTreeModel] rows that this context was requested for using
      gtk_cell_area_get_preferred_height(). *)

  method natural_width : int
  (** The natural width for the [GtkCellArea] in this context for all
      [GtkTreeModel] rows that this context was requested for using
      gtk_cell_area_get_preferred_width(). *)

  (** {2:conversions Conversions} *)

  method as_cell_area_context : Raw.Cell_area_context.t
end

and cell_layout_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_cell_layout : Raw.Cell_layout.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [CellLayout].}\n\n\
     An interface for packing cells\n\n\
     [GtkCellLayout] is an interface to be implemented by all objects which\n\
     want to provide a [GtkTreeViewColumn] like API for packing cells,\n\
     setting attributes and data funcs.\n\n\
     One of the notable features provided by implementations of\n\
     [GtkCellLayout] are attributes. Attributes let you set the properties\n\
     in flexible ways. They can just be set to constant values like regular\n\
     properties. But they can also be mapped to a column of the underlying\n\
     tree model with gtk_cell_layout_set_attributes(), which means that the \
     value\n\
     of the attribute can change from cell to cell as they are rendered by\n\
     the cell renderer. Finally, it is possible to specify a function with\n\
     gtk_cell_layout_set_cell_data_func() that is called to determine the\n\
     value of the attribute for each cell that is rendered.\n\n\
     {b GtkCellLayouts as GtkBuildable}\n\n\
     Implementations of GtkCellLayout which also implement the GtkBuildable\n\
     interface ([GtkCellView], [GtkIconView], [GtkComboBox],\n\
     [GtkEntryCompletion], [GtkTreeViewColumn]) accept [GtkCellRenderer] objects\n\
     as [<child>] elements in UI definitions. They support a custom \
     [<attributes>]\n\
     element for their children, which can contain multiple [<attribute>]\n\
     elements. Each [<attribute>] element has a name attribute which specifies\n\
     a property of the cell renderer; the content of the element is the\n\
     attribute value.\n\n\
     This is an example of a UI definition fragment specifying attributes:\n\n\
     {[\n\
     <object class=\"GtkCellView\">\n\
    \  <child>\n\
    \    <object class=\"GtkCellRendererText\"/>\n\
    \    <attributes>\n\
    \      <attribute name=\"text\">0</attribute>\n\
    \    </attributes>\n\
    \  </child>\n\
     </object>\n\
     ]}\n\n\
     Furthermore for implementations of [GtkCellLayout] that use a [GtkCellArea]\n\
     to lay out cells (all [GtkCellLayout]s in GTK use a [GtkCellArea])\n\
     cell properties can also be defined\n\
     in the format by specifying the custom [<cell-packing>] attribute which can\n\
     contain multiple [<property>] elements.\n\n\
     Here is a UI definition fragment specifying cell properties:\n\n\
     {[\n\
     <object class=\"GtkTreeViewColumn\">\n\
    \  <child>\n\
    \    <object class=\"GtkCellRendererText\"/>\n\
    \    <cell-packing>\n\
    \      <property name=\"align\">True</property>\n\
    \      <property name=\"expand\">False</property>\n\
    \    </cell-packing>\n\
    \  </child>\n\
     </object>\n\
     ]}\n\n\
     {b Subclassing GtkCellLayout implementations}\n\n\
     When subclassing a widget that implements [GtkCellLayout] like\n\
     [GtkIconView] or [GtkComboBox], there are some considerations related\n\
     to the fact that these widgets internally use a [GtkCellArea].\n\
     The cell area is exposed as a construct-only property by these\n\
     widgets. This means that it is possible to e.g. do\n\n\
     {[\n\
     GtkWIdget *combo =\n\
    \  g_object_new (GTK_TYPE_COMBO_BOX, \"cell-area\", my_cell_area, NULL);\n\
     ]}\n\n\
     to use a custom cell area with a combo box. But construct properties\n\
     are only initialized after instance [init()]\n\
     functions have run, which means that using functions which rely on\n\
     the existence of the cell area in your subclass [init()] function will\n\
     cause the default cell area to be instantiated. In this case, a provided\n\
     construct property value will be ignored (with a warning, to alert\n\
     you to the problem).\n\n\
     {[\n\
     static void\n\
     my_combo_box_init (MyComboBox *b)\n\
     {\n\
    \  GtkCellRenderer *cell;\n\n\
    \  cell = gtk_cell_renderer_pixbuf_new ();\n\n\
    \  // The following call causes the default cell area for combo boxes,\n\
    \  // a GtkCellAreaBox, to be instantiated\n\
    \  gtk_cell_layout_pack_start (GTK_CELL_LAYOUT (b), cell, FALSE);\n\
    \  ...\n\
     }\n\n\
     GtkWidget *\n\
     my_combo_box_new (GtkCellArea *area)\n\
     {\n\
    \  // This call is going to cause a warning about area being ignored\n\
    \  return g_object_new (MY_TYPE_COMBO_BOX, \"cell-area\", area, NULL);\n\
     }\n\
     ]}\n\n\
     If supporting alternative cell areas with your derived widget is\n\
     not important, then this does not have to concern you. If you want\n\
     to support alternative cell areas, you can do so by moving the\n\
     problematic calls out of [init()] and into a [constructor()]\n\
     for your class."]

(** Wraps a raw handle of {!Ocgtk.Raw.Cell_area.t}. *)
class cell_area : Raw.Cell_area.t -> cell_area_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_area_context.t}. *)

and cell_area_context : Raw.Cell_area_context.t -> cell_area_context_t
(** Wraps a raw handle of {!Ocgtk.Raw.Cell_layout.t}. *)

and cell_layout : Raw.Cell_layout.t -> cell_layout_t
