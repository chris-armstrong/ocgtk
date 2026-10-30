(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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
      [gtk_cell_area_apply_attributes ()] is called and can be used to interact
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
      [gtk_cell_area_add_focus_sibling ()]). *)

  method remove : Cell_renderer.cell_renderer_t -> unit
  (** Removes [renderer] from [area]. *)

  method remove_focus_sibling :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t -> unit
  (** Removes [sibling] from [renderer]’s focus sibling list (see
      [gtk_cell_area_add_focus_sibling ()]). *)

  method set_focus_cell : Cell_renderer.cell_renderer_t option -> unit
  (** Explicitly sets the currently focused cell to [renderer].

      This is generally called by implementations of [GtkCellAreaClass.focus()]
      or [GtkCellAreaClass.event()], however it can also be used to implement
      functions such as [gtk_tree_view_set_cursor_on_cell ()]. *)

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

      If [canceled] is [true], the currently edited cell renderer will emit the
      ::editing-canceled signal, otherwise the the ::editing-done signal will be
      emitted on the current edit widget.

      See [gtk_cell_area_get_edited_cell ()] and
      [gtk_cell_area_get_edit_widget ()]. *)

  (** {2:conversions Conversions} *)

  method as_cell_area : Raw.Cell_area.t
end

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
      requested height over a series of [gtk_cell_area_get_preferred_height ()]
      requests. *)

  method push_preferred_width : int -> int -> unit
  (** Causes the minimum and/or natural width to grow if the new proposed sizes
      exceed the current minimum and natural width.

      This is used by [GtkCellAreaContext] implementations during the request
      process over a series of [GtkTreeModel] rows to progressively push the
      requested width over a series of [gtk_cell_area_get_preferred_width ()]
      requests. *)

  method reset : unit -> unit
  (** Resets any previously cached request and allocation data.

      When underlying [GtkTreeModel] data changes its important to reset the
      context if the content size is allowed to shrink. If the content size is
      only allowed to grow (this is usually an option for views rendering large
      data stores as a measure of optimization), then only the row that changed
      or was inserted needs to be (re)requested with
      [gtk_cell_area_get_preferred_width ()].

      When the new overall size of the context requires that the allocated size
      changes (or whenever this allocation changes at all), the variable row
      sizes need to be re-requested for every row.

      For instance, if the rows are displayed all with the same width from top
      to bottom then a change in the allocated width necessitates a
      recalculation of all the displayed row heights using
      [gtk_cell_area_get_preferred_height_for_width ()]. *)

  (** {2:properties Properties} *)

  method minimum_height : int
  (** The minimum height for the [GtkCellArea] in this context for all
      [GtkTreeModel] rows that this context was requested for using
      [gtk_cell_area_get_preferred_height ()]. *)

  method minimum_width : int
  (** The minimum width for the [GtkCellArea] in this context for all
      [GtkTreeModel] rows that this context was requested for using
      [gtk_cell_area_get_preferred_width ()]. *)

  method natural_height : int
  (** The natural height for the [GtkCellArea] in this context for all
      [GtkTreeModel] rows that this context was requested for using
      [gtk_cell_area_get_preferred_height ()]. *)

  method natural_width : int
  (** The natural width for the [GtkCellArea] in this context for all
      [GtkTreeModel] rows that this context was requested for using
      [gtk_cell_area_get_preferred_width ()]. *)

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
      [gtk_cell_layout_set_attributes ()]. *)

  method get_area : unit -> cell_area_t option
  (** Returns the underlying [GtkCellArea] which might be [cell_layout] if
      called on a [GtkCellArea] or might be [None] if no [GtkCellArea] is used
      by [cell_layout]. *)

  method get_cells : unit -> Cell_renderer.cell_renderer_t list
  (** Returns the cell renderers which have been added to [cell_layout]. *)

  method pack_end : Cell_renderer.cell_renderer_t -> bool -> unit
  (** Adds the [cell] to the end of [cell_layout]. If [expand] is [false], then
      the [cell] is allocated no more space than it needs. Any unused space is
      divided evenly between cells for which [expand] is [true].

      Note that reusing the same cell renderer is not supported. *)

  method pack_start : Cell_renderer.cell_renderer_t -> bool -> unit
  (** Packs the [cell] into the beginning of [cell_layout]. If [expand] is
      [false], then the [cell] is allocated no more space than it needs. Any
      unused space is divided evenly between cells for which [expand] is [true].

      Note that reusing the same cell renderer is not supported. *)

  method reorder : Cell_renderer.cell_renderer_t -> int -> unit
  (** Re-inserts [cell] at [position].

      Note that [cell] has already to be packed into [cell_layout] for this to
      function properly. *)

  (** {2:conversions Conversions} *)

  method as_cell_layout : Raw.Cell_layout.t
end

class cell_area (obj : Raw.Cell_area.t) : cell_area_t =
  object (self)
    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)

    method on_focus_changed ?(after = false) ~callback () =
      Raw.Cell_area.on_focus_changed ~after self#as_cell_area
        ~callback:(fun ~renderer ~path ->
          callback ~renderer:(new Cell_renderer.cell_renderer renderer) ~path)

    method on_remove_editable ?(after = false) ~callback () =
      Raw.Cell_area.on_remove_editable ~after self#as_cell_area
        ~callback:(fun ~renderer ~editable ->
          callback
            ~renderer:(new Cell_renderer.cell_renderer renderer)
            ~editable:(new Cell_editable.cell_editable editable))

    method activate :
        cell_area_context_t ->
        Widget.widget_t ->
        Ocgdk.Rectangle.rectangle_t ->
        Enums.cellrendererstate ->
        bool ->
        bool =
      fun context widget cell_area flags edit_only ->
        let context = context#as_cell_area_context in
        let widget = widget#as_widget in
        let cell_area = cell_area#as_rectangle in
        Raw.Cell_area.activate obj context widget cell_area flags edit_only

    method activate_cell :
        Widget.widget_t ->
        Cell_renderer.cell_renderer_t ->
        Ocgdk.Event.event_t ->
        Ocgdk.Rectangle.rectangle_t ->
        Enums.cellrendererstate ->
        bool =
      fun widget renderer event cell_area flags ->
        let widget = widget#as_widget in
        let renderer = renderer#as_cell_renderer in
        let event = event#as_event in
        let cell_area = cell_area#as_rectangle in
        Raw.Cell_area.activate_cell obj widget renderer event cell_area flags

    method add : Cell_renderer.cell_renderer_t -> unit =
      fun renderer ->
        let renderer = renderer#as_cell_renderer in
        Raw.Cell_area.add obj renderer

    method add_focus_sibling :
        Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t -> unit =
      fun renderer sibling ->
        let renderer = renderer#as_cell_renderer in
        let sibling = sibling#as_cell_renderer in
        Raw.Cell_area.add_focus_sibling obj renderer sibling

    method apply_attributes :
        Tree_model.tree_model_t -> Raw.Tree_iter.t -> bool -> bool -> unit =
      fun tree_model iter is_expander is_expanded ->
        let tree_model = tree_model#as_tree_model in
        Raw.Cell_area.apply_attributes obj tree_model iter is_expander
          is_expanded

    method attribute_connect :
        Cell_renderer.cell_renderer_t -> string -> int -> unit =
      fun renderer attribute column ->
        let renderer = renderer#as_cell_renderer in
        Raw.Cell_area.attribute_connect obj renderer attribute column

    method attribute_disconnect :
        Cell_renderer.cell_renderer_t -> string -> unit =
      fun renderer attribute ->
        let renderer = renderer#as_cell_renderer in
        Raw.Cell_area.attribute_disconnect obj renderer attribute

    method attribute_get_column : Cell_renderer.cell_renderer_t -> string -> int
        =
      fun renderer attribute ->
        let renderer = renderer#as_cell_renderer in
        Raw.Cell_area.attribute_get_column obj renderer attribute

    method cell_get_property :
        Cell_renderer.cell_renderer_t -> string -> Gobject.Value.t -> unit =
      fun renderer property_name value ->
        let renderer = renderer#as_cell_renderer in
        Raw.Cell_area.cell_get_property obj renderer property_name value

    method cell_set_property :
        Cell_renderer.cell_renderer_t -> string -> Gobject.Value.t -> unit =
      fun renderer property_name value ->
        let renderer = renderer#as_cell_renderer in
        Raw.Cell_area.cell_set_property obj renderer property_name value

    method copy_context : cell_area_context_t -> cell_area_context_t =
      fun context ->
        let context = context#as_cell_area_context in
        new cell_area_context (Raw.Cell_area.copy_context obj context)

    method create_context : unit -> cell_area_context_t =
      fun () -> new cell_area_context (Raw.Cell_area.create_context obj)

    method event :
        cell_area_context_t ->
        Widget.widget_t ->
        Ocgdk.Event.event_t ->
        Ocgdk.Rectangle.rectangle_t ->
        Enums.cellrendererstate ->
        int =
      fun context widget event cell_area flags ->
        let context = context#as_cell_area_context in
        let widget = widget#as_widget in
        let event = event#as_event in
        let cell_area = cell_area#as_rectangle in
        Raw.Cell_area.event obj context widget event cell_area flags

    method focus : Enums.directiontype -> bool =
      fun direction -> Raw.Cell_area.focus obj direction

    method get_current_path_string : unit -> string =
      fun () -> Raw.Cell_area.get_current_path_string obj

    method get_edit_widget : unit -> Cell_editable.cell_editable_t option =
      fun () ->
        Option.map
          (fun ret -> new Cell_editable.cell_editable ret)
          (Raw.Cell_area.get_edit_widget obj)

    method get_edited_cell : unit -> Cell_renderer.cell_renderer_t option =
      fun () ->
        Option.map
          (fun ret -> new Cell_renderer.cell_renderer ret)
          (Raw.Cell_area.get_edited_cell obj)

    method get_focus_cell : unit -> Cell_renderer.cell_renderer_t option =
      fun () ->
        Option.map
          (fun ret -> new Cell_renderer.cell_renderer ret)
          (Raw.Cell_area.get_focus_cell obj)

    method get_focus_from_sibling :
        Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t option =
      fun renderer ->
        let renderer = renderer#as_cell_renderer in
        Option.map
          (fun ret -> new Cell_renderer.cell_renderer ret)
          (Raw.Cell_area.get_focus_from_sibling obj renderer)

    method get_focus_siblings :
        Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t list =
      fun renderer ->
        let renderer = renderer#as_cell_renderer in
        (List.map (fun ret -> new Cell_renderer.cell_renderer ret))
          (Raw.Cell_area.get_focus_siblings obj renderer)

    method get_request_mode : unit -> Enums.sizerequestmode =
      fun () -> Raw.Cell_area.get_request_mode obj

    method has_renderer : Cell_renderer.cell_renderer_t -> bool =
      fun renderer ->
        let renderer = renderer#as_cell_renderer in
        Raw.Cell_area.has_renderer obj renderer

    method is_activatable : unit -> bool =
      fun () -> Raw.Cell_area.is_activatable obj

    method is_focus_sibling :
        Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t -> bool =
      fun renderer sibling ->
        let renderer = renderer#as_cell_renderer in
        let sibling = sibling#as_cell_renderer in
        Raw.Cell_area.is_focus_sibling obj renderer sibling

    method remove : Cell_renderer.cell_renderer_t -> unit =
      fun renderer ->
        let renderer = renderer#as_cell_renderer in
        Raw.Cell_area.remove obj renderer

    method remove_focus_sibling :
        Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t -> unit =
      fun renderer sibling ->
        let renderer = renderer#as_cell_renderer in
        let sibling = sibling#as_cell_renderer in
        Raw.Cell_area.remove_focus_sibling obj renderer sibling

    method set_focus_cell : Cell_renderer.cell_renderer_t option -> unit =
      fun renderer ->
        let renderer = Option.map (fun c -> c#as_cell_renderer) renderer in
        Raw.Cell_area.set_focus_cell obj renderer

    method snapshot :
        cell_area_context_t ->
        Widget.widget_t ->
        Snapshot.snapshot_t ->
        Ocgdk.Rectangle.rectangle_t ->
        Ocgdk.Rectangle.rectangle_t ->
        Enums.cellrendererstate ->
        bool ->
        unit =
      fun context widget snapshot background_area cell_area flags paint_focus ->
        let context = context#as_cell_area_context in
        let widget = widget#as_widget in
        let snapshot = snapshot#as_snapshot in
        let background_area = background_area#as_rectangle in
        let cell_area = cell_area#as_rectangle in
        Raw.Cell_area.snapshot obj context widget snapshot background_area
          cell_area flags paint_focus

    method stop_editing : bool -> unit =
      fun canceled -> Raw.Cell_area.stop_editing obj canceled

    method as_cell_area = obj
  end

and cell_area_context (obj : Raw.Cell_area_context.t) : cell_area_context_t =
  object (self)
    method allocate : int -> int -> unit =
      fun width height -> Raw.Cell_area_context.allocate obj width height

    method get_area : unit -> cell_area_t =
      fun () -> new cell_area (Raw.Cell_area_context.get_area obj)

    method push_preferred_height : int -> int -> unit =
      fun minimum_height natural_height ->
        Raw.Cell_area_context.push_preferred_height obj minimum_height
          natural_height

    method push_preferred_width : int -> int -> unit =
      fun minimum_width natural_width ->
        Raw.Cell_area_context.push_preferred_width obj minimum_width
          natural_width

    method reset : unit -> unit = fun () -> Raw.Cell_area_context.reset obj
    method minimum_height = Raw.Cell_area_context.get_minimum_height obj
    method minimum_width = Raw.Cell_area_context.get_minimum_width obj
    method natural_height = Raw.Cell_area_context.get_natural_height obj
    method natural_width = Raw.Cell_area_context.get_natural_width obj
    method as_cell_area_context = obj
  end

and cell_layout (obj : Raw.Cell_layout.t) : cell_layout_t =
  object (self)
    method add_attribute :
        Cell_renderer.cell_renderer_t -> string -> int -> unit =
      fun cell attribute column ->
        let cell = cell#as_cell_renderer in
        Raw.Cell_layout.add_attribute obj cell attribute column

    method clear : unit -> unit = fun () -> Raw.Cell_layout.clear obj

    method clear_attributes : Cell_renderer.cell_renderer_t -> unit =
      fun cell ->
        let cell = cell#as_cell_renderer in
        Raw.Cell_layout.clear_attributes obj cell

    method get_area : unit -> cell_area_t option =
      fun () ->
        Option.map (fun ret -> new cell_area ret) (Raw.Cell_layout.get_area obj)

    method get_cells : unit -> Cell_renderer.cell_renderer_t list =
      fun () ->
        (List.map (fun ret -> new Cell_renderer.cell_renderer ret))
          (Raw.Cell_layout.get_cells obj)

    method pack_end : Cell_renderer.cell_renderer_t -> bool -> unit =
      fun cell expand ->
        let cell = cell#as_cell_renderer in
        Raw.Cell_layout.pack_end obj cell expand

    method pack_start : Cell_renderer.cell_renderer_t -> bool -> unit =
      fun cell expand ->
        let cell = cell#as_cell_renderer in
        Raw.Cell_layout.pack_start obj cell expand

    method reorder : Cell_renderer.cell_renderer_t -> int -> unit =
      fun cell position ->
        let cell = cell#as_cell_renderer in
        Raw.Cell_layout.reorder obj cell position

    method as_cell_layout = obj
  end
