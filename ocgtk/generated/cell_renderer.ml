class type cell_renderer_t = object
  method on_editing_canceled :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_editing_started :
    ?after:bool ->
    callback:(editable:Cell_editable.cell_editable_t -> path:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method activate :
    Ocgdk.Event.event_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    Ocgdk.Rectangle.rectangle_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    bool

  method get_is_expanded : unit -> bool
  method get_is_expander : unit -> bool
  method get_request_mode : unit -> Enums.sizerequestmode
  method get_sensitive : unit -> bool

  method get_state :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    Enums.cellrendererstate ->
    Enums.stateflags

  method get_visible : unit -> bool
  method is_activatable : unit -> bool
  method set_alignment : float -> float -> unit
  method set_fixed_size : int -> int -> unit
  method set_is_expanded : bool -> unit
  method set_is_expander : bool -> unit
  method set_padding : int -> int -> unit
  method set_sensitive : bool -> unit
  method set_visible : bool -> unit

  method snapshot :
    Snapshot.snapshot_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    unit

  method start_editing :
    Ocgdk.Event.event_t option ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    string ->
    Ocgdk.Rectangle.rectangle_t ->
    Ocgdk.Rectangle.rectangle_t ->
    Enums.cellrendererstate ->
    Cell_editable.cell_editable_t option

  method stop_editing : bool -> unit
  method set_cell_background : string -> unit
  method cell_background_rgba : Ocgdk.Rgb_a.rgb_a_t
  method set_cell_background_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  method cell_background_set : bool
  method set_cell_background_set : bool -> unit
  method editing : bool
  method height : int
  method set_height : int -> unit
  method mode : Enums.cellrenderermode
  method set_mode : Enums.cellrenderermode -> unit
  method width : int
  method set_width : int -> unit
  method xalign : float
  method set_xalign : float -> unit
  method xpad : int
  method set_xpad : int -> unit
  method yalign : float
  method set_yalign : float -> unit
  method ypad : int
  method set_ypad : int -> unit
  method as_cell_renderer : Raw.Cell_renderer.t
end

(* High-level class for CellRenderer *)
class cell_renderer (obj : Raw.Cell_renderer.t) : cell_renderer_t =
  object (self)
    method on_editing_canceled ?(after = false) ~callback () =
      Raw.Cell_renderer.on_editing_canceled ~after self#as_cell_renderer
        ~callback

    method on_editing_started ?(after = false) ~callback () =
      Raw.Cell_renderer.on_editing_started ~after self#as_cell_renderer
        ~callback:(fun ~editable ~path ->
          callback ~editable:(new Cell_editable.cell_editable editable) ~path)

    method activate :
        Ocgdk.Event.event_t ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        string ->
        Ocgdk.Rectangle.rectangle_t ->
        Ocgdk.Rectangle.rectangle_t ->
        Enums.cellrendererstate ->
        bool =
      fun event widget path background_area cell_area flags ->
        let event = event#as_event in
        let widget = widget#as_widget in
        let background_area = background_area#as_rectangle in
        let cell_area = cell_area#as_rectangle in
        Raw.Cell_renderer.activate obj event widget path background_area
          cell_area flags

    method get_is_expanded : unit -> bool =
      fun () -> Raw.Cell_renderer.get_is_expanded obj

    method get_is_expander : unit -> bool =
      fun () -> Raw.Cell_renderer.get_is_expander obj

    method get_request_mode : unit -> Enums.sizerequestmode =
      fun () -> Raw.Cell_renderer.get_request_mode obj

    method get_sensitive : unit -> bool =
      fun () -> Raw.Cell_renderer.get_sensitive obj

    method get_state :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        Enums.cellrendererstate ->
        Enums.stateflags =
      fun widget cell_state ->
        let widget = Option.map (fun c -> c#as_widget) widget in
        Raw.Cell_renderer.get_state obj widget cell_state

    method get_visible : unit -> bool =
      fun () -> Raw.Cell_renderer.get_visible obj

    method is_activatable : unit -> bool =
      fun () -> Raw.Cell_renderer.is_activatable obj

    method set_alignment : float -> float -> unit =
      fun xalign yalign -> Raw.Cell_renderer.set_alignment obj xalign yalign

    method set_fixed_size : int -> int -> unit =
      fun width height -> Raw.Cell_renderer.set_fixed_size obj width height

    method set_is_expanded : bool -> unit =
      fun is_expanded -> Raw.Cell_renderer.set_is_expanded obj is_expanded

    method set_is_expander : bool -> unit =
      fun is_expander -> Raw.Cell_renderer.set_is_expander obj is_expander

    method set_padding : int -> int -> unit =
      fun xpad ypad -> Raw.Cell_renderer.set_padding obj xpad ypad

    method set_sensitive : bool -> unit =
      fun sensitive -> Raw.Cell_renderer.set_sensitive obj sensitive

    method set_visible : bool -> unit =
      fun visible -> Raw.Cell_renderer.set_visible obj visible

    method snapshot :
        Snapshot.snapshot_t ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Ocgdk.Rectangle.rectangle_t ->
        Ocgdk.Rectangle.rectangle_t ->
        Enums.cellrendererstate ->
        unit =
      fun snapshot widget background_area cell_area flags ->
        let snapshot = snapshot#as_snapshot in
        let widget = widget#as_widget in
        let background_area = background_area#as_rectangle in
        let cell_area = cell_area#as_rectangle in
        Raw.Cell_renderer.snapshot obj snapshot widget background_area cell_area
          flags

    method start_editing :
        Ocgdk.Event.event_t option ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        string ->
        Ocgdk.Rectangle.rectangle_t ->
        Ocgdk.Rectangle.rectangle_t ->
        Enums.cellrendererstate ->
        Cell_editable.cell_editable_t option =
      fun event widget path background_area cell_area flags ->
        let event = Option.map (fun c -> c#as_event) event in
        let widget = widget#as_widget in
        let background_area = background_area#as_rectangle in
        let cell_area = cell_area#as_rectangle in
        Option.map
          (fun ret -> new Cell_editable.cell_editable ret)
          (Raw.Cell_renderer.start_editing obj event widget path background_area
             cell_area flags)

    method stop_editing : bool -> unit =
      fun canceled -> Raw.Cell_renderer.stop_editing obj canceled

    method set_cell_background v = Raw.Cell_renderer.set_cell_background obj v

    method cell_background_rgba =
      new Ocgdk.Rgb_a.rgb_a (Raw.Cell_renderer.get_cell_background_rgba obj)

    method set_cell_background_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit =
      fun v -> Raw.Cell_renderer.set_cell_background_rgba obj v#as_rgb_a

    method cell_background_set = Raw.Cell_renderer.get_cell_background_set obj

    method set_cell_background_set v =
      Raw.Cell_renderer.set_cell_background_set obj v

    method editing = Raw.Cell_renderer.get_editing obj
    method height = Raw.Cell_renderer.get_height obj
    method set_height v = Raw.Cell_renderer.set_height obj v
    method mode = Raw.Cell_renderer.get_mode obj
    method set_mode v = Raw.Cell_renderer.set_mode obj v
    method width = Raw.Cell_renderer.get_width obj
    method set_width v = Raw.Cell_renderer.set_width obj v
    method xalign = Raw.Cell_renderer.get_xalign obj
    method set_xalign v = Raw.Cell_renderer.set_xalign obj v
    method xpad = Raw.Cell_renderer.get_xpad obj
    method set_xpad v = Raw.Cell_renderer.set_xpad obj v
    method yalign = Raw.Cell_renderer.get_yalign obj
    method set_yalign v = Raw.Cell_renderer.set_yalign obj v
    method ypad = Raw.Cell_renderer.get_ypad obj
    method set_ypad v = Raw.Cell_renderer.set_ypad obj v
    method as_cell_renderer = obj
  end
