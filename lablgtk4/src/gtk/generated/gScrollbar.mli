class scrollbar : Scrollbar.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_adjustment : unit -> GAdjustment.adjustment
    method set_adjustment : #GAdjustment.adjustment option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_scrollbar : Scrollbar.t
  end

