class type scrollbar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Accessible_range.accessible_range_t
  inherit Orientable.orientable_t
  method get_adjustment : unit -> Adjustment.adjustment_t
  method set_adjustment : Adjustment.adjustment_t option -> unit
  method as_scrollbar : Raw.Scrollbar.t
end

class scrollbar : Raw.Scrollbar.t -> scrollbar_t

val new_ : Enums.orientation -> Adjustment.adjustment_t option -> scrollbar_t
