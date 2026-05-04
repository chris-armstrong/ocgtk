class type scale_button_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GAccessible_range.accessible_range_t
  inherit GOrientable.orientable_t
  method on_popdown : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method on_popup : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_value_changed :
    callback:(value:float -> unit) -> Gobject.Signal.handler_id

  method get_active : unit -> bool
  method get_adjustment : unit -> GAdjustment.adjustment_t
  method get_has_frame : unit -> bool
  method get_minus_button : unit -> GButton.button_t
  method get_plus_button : unit -> GButton.button_t

  method get_popup :
    unit ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  method get_value : unit -> float
  method set_adjustment : GAdjustment.adjustment_t -> unit
  method set_has_frame : bool -> unit
  method set_icons : string array -> unit
  method set_value : float -> unit
  method as_scale_button : Scale_button.t
end

class scale_button : Scale_button.t -> scale_button_t

val new_ : float -> float -> float -> string array option -> scale_button_t
