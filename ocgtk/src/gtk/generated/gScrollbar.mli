class type scrollbar_t = object
    method get_adjustment : unit -> GAdjustment.adjustment_t
    method set_adjustment : GAdjustment.adjustment_t option -> unit
    method as_scrollbar : Scrollbar.t
end

class scrollbar : Scrollbar.t -> scrollbar_t

