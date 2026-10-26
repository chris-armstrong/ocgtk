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

class cell_renderer : Raw.Cell_renderer.t -> cell_renderer_t
