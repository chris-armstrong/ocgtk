class range : Range.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Grange_signals.range_signals
    method fill_level : float
    method set_fill_level : float -> unit
    method inverted : bool
    method set_inverted : bool -> unit
    method restrict_to_fill_level : bool
    method set_restrict_to_fill_level : bool -> unit
    method round_digits : int
    method set_round_digits : int -> unit
    method show_fill_level : bool
    method set_show_fill_level : bool -> unit
    method get_adjustment : unit -> GAdjustment.adjustment
    method get_flippable : unit -> bool
    method get_slider_size_fixed : unit -> bool
    method get_value : unit -> float
    method set_adjustment : #GAdjustment.adjustment -> unit
    method set_flippable : bool -> unit
    method set_increments : float -> float -> unit
    method set_range : float -> float -> unit
    method set_slider_size_fixed : bool -> unit
    method set_value : float -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_range : Range.t
  end

