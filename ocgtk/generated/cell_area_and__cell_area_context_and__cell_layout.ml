(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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

  method activate_cell :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Cell_renderer.cell_renderer_t ->
    Ocgdk.Event.event_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    bool

  method add : Cell_renderer.cell_renderer_t -> unit

  method add_focus_sibling :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t -> unit

  method apply_attributes :
    Tree_model.tree_model_t -> Raw.Tree_iter.t -> bool -> bool -> unit

  method attribute_connect :
    Cell_renderer.cell_renderer_t -> string -> int -> unit

  method attribute_disconnect : Cell_renderer.cell_renderer_t -> string -> unit
  method attribute_get_column : Cell_renderer.cell_renderer_t -> string -> int

  method cell_get_property :
    Cell_renderer.cell_renderer_t -> string -> Gobject.Value.t -> unit

  method cell_set_property :
    Cell_renderer.cell_renderer_t -> string -> Gobject.Value.t -> unit

  method copy_context : cell_area_context_t -> cell_area_context_t
  method create_context : unit -> cell_area_context_t

  method event :
    cell_area_context_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Ocgdk.Event.event_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    int

  method focus : Enums.directiontype -> bool
  method get_current_path_string : unit -> string
  method get_edit_widget : unit -> Cell_editable.cell_editable_t option
  method get_edited_cell : unit -> Cell_renderer.cell_renderer_t option
  method get_focus_cell : unit -> Cell_renderer.cell_renderer_t option

  method get_focus_from_sibling :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t option

  method get_focus_siblings :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t list

  method get_request_mode : unit -> Enums.sizerequestmode
  method has_renderer : Cell_renderer.cell_renderer_t -> bool
  method is_activatable : unit -> bool

  method is_focus_sibling :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t -> bool

  method remove : Cell_renderer.cell_renderer_t -> unit

  method remove_focus_sibling :
    Cell_renderer.cell_renderer_t -> Cell_renderer.cell_renderer_t -> unit

  method set_focus_cell : Cell_renderer.cell_renderer_t option -> unit

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

  method stop_editing : bool -> unit
  method as_cell_area : Raw.Cell_area.t
end

and cell_area_context_t = object
  method allocate : int -> int -> unit
  method get_area : unit -> cell_area_t
  method push_preferred_height : int -> int -> unit
  method push_preferred_width : int -> int -> unit
  method reset : unit -> unit
  method minimum_height : int
  method minimum_width : int
  method natural_height : int
  method natural_width : int
  method as_cell_area_context : Raw.Cell_area_context.t
end

and cell_layout_t = object
  method add_attribute : Cell_renderer.cell_renderer_t -> string -> int -> unit
  method clear : unit -> unit
  method clear_attributes : Cell_renderer.cell_renderer_t -> unit
  method get_area : unit -> cell_area_t option
  method get_cells : unit -> Cell_renderer.cell_renderer_t list
  method pack_end : Cell_renderer.cell_renderer_t -> bool -> unit
  method pack_start : Cell_renderer.cell_renderer_t -> bool -> unit
  method reorder : Cell_renderer.cell_renderer_t -> int -> unit
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
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
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
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
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
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
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
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
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
