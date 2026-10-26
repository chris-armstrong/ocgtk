class type level_bar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t

  method on_offset_changed :
    ?after:bool ->
    callback:(name:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method add_offset_value : string -> float -> unit
  method get_inverted : unit -> bool
  method get_max_value : unit -> float
  method get_min_value : unit -> float
  method get_mode : unit -> Enums.levelbarmode
  method get_value : unit -> float
  method remove_offset_value : string option -> unit
  method set_inverted : bool -> unit
  method set_max_value : float -> unit
  method set_min_value : float -> unit
  method set_mode : Enums.levelbarmode -> unit
  method set_value : float -> unit
  method as_level_bar : Raw.Level_bar.t
end

class level_bar : Raw.Level_bar.t -> level_bar_t

val new_ : unit -> level_bar_t
val new_for_interval : float -> float -> level_bar_t
