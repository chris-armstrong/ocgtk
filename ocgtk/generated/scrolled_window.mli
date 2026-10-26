class type scrolled_window_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_edge_overshot :
    ?after:bool ->
    callback:(pos:Enums.positiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_edge_reached :
    ?after:bool ->
    callback:(pos:Enums.positiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_move_focus_out :
    ?after:bool ->
    callback:(direction_type:Enums.directiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_scroll_child :
    ?after:bool ->
    callback:(scroll:Enums.scrolltype -> horizontal:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_hadjustment : unit -> Adjustment.adjustment_t
  method get_has_frame : unit -> bool

  method get_hscrollbar :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_kinetic_scrolling : unit -> bool
  method get_max_content_height : unit -> int
  method get_max_content_width : unit -> int
  method get_min_content_height : unit -> int
  method get_min_content_width : unit -> int
  method get_overlay_scrolling : unit -> bool
  method get_placement : unit -> Enums.cornertype
  method get_propagate_natural_height : unit -> bool
  method get_propagate_natural_width : unit -> bool
  method get_vadjustment : unit -> Adjustment.adjustment_t

  method get_vscrollbar :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_hadjustment : Adjustment.adjustment_t option -> unit
  method set_has_frame : bool -> unit
  method set_kinetic_scrolling : bool -> unit
  method set_max_content_height : int -> unit
  method set_max_content_width : int -> unit
  method set_min_content_height : int -> unit
  method set_min_content_width : int -> unit
  method set_overlay_scrolling : bool -> unit
  method set_placement : Enums.cornertype -> unit
  method set_policy : Enums.policytype -> Enums.policytype -> unit
  method set_propagate_natural_height : bool -> unit
  method set_propagate_natural_width : bool -> unit
  method set_vadjustment : Adjustment.adjustment_t option -> unit
  method unset_placement : unit -> unit
  method hscrollbar_policy : Enums.policytype
  method set_hscrollbar_policy : Enums.policytype -> unit
  method vscrollbar_policy : Enums.policytype
  method set_vscrollbar_policy : Enums.policytype -> unit
  method as_scrolled_window : Raw.Scrolled_window.t
end

class scrolled_window : Raw.Scrolled_window.t -> scrolled_window_t

val new_ : unit -> scrolled_window_t
