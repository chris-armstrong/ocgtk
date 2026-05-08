class type range_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GAccessible_range.accessible_range_t
  inherit GOrientable.orientable_t

  method on_adjust_bounds :
    callback:(value:float -> unit) -> Gobject.Signal.handler_id

  method on_change_value :
    callback:(scroll:Gtk_enums.scrolltype -> value:float -> bool) ->
    Gobject.Signal.handler_id

  method on_move_slider :
    callback:(step:Gtk_enums.scrolltype -> unit) -> Gobject.Signal.handler_id

  method on_value_changed : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method get_adjustment : unit -> GAdjustment.adjustment_t
  method get_fill_level : unit -> float
  method get_flippable : unit -> bool
  method get_inverted : unit -> bool
  method get_restrict_to_fill_level : unit -> bool
  method get_round_digits : unit -> int
  method get_show_fill_level : unit -> bool
  method get_slider_size_fixed : unit -> bool
  method get_value : unit -> float
  method set_adjustment : GAdjustment.adjustment_t -> unit
  method set_fill_level : float -> unit
  method set_flippable : bool -> unit
  method set_increments : float -> float -> unit
  method set_inverted : bool -> unit
  method set_range : float -> float -> unit
  method set_restrict_to_fill_level : bool -> unit
  method set_round_digits : int -> unit
  method set_show_fill_level : bool -> unit
  method set_slider_size_fixed : bool -> unit
  method set_value : float -> unit
  method as_range : Range.t
end

class range : Range.t -> range_t
