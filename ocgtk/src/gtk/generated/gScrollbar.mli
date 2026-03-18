class scrollbar : Scrollbar.t ->
  object
    method get_adjustment : unit -> GAdjustment.adjustment
    method set_adjustment : #GAdjustment.adjustment option -> unit
    method as_scrollbar : Scrollbar.t
  end

