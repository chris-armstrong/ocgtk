class type scrollable_t = object
  method get_hadjustment : unit -> Adjustment.adjustment_t option
  method get_hscroll_policy : unit -> Enums.scrollablepolicy
  method get_vadjustment : unit -> Adjustment.adjustment_t option
  method get_vscroll_policy : unit -> Enums.scrollablepolicy
  method set_hadjustment : Adjustment.adjustment_t option -> unit
  method set_hscroll_policy : Enums.scrollablepolicy -> unit
  method set_vadjustment : Adjustment.adjustment_t option -> unit
  method set_vscroll_policy : Enums.scrollablepolicy -> unit
  method as_scrollable : Raw.Scrollable.t
end

class scrollable : Raw.Scrollable.t -> scrollable_t
