class type scrollbar_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_adjustment : unit -> GAdjustment.adjustment_t
    method set_adjustment : GAdjustment.adjustment_t option -> unit
    method as_scrollbar : Scrollbar.t
end

class scrollbar : Scrollbar.t -> scrollbar_t

