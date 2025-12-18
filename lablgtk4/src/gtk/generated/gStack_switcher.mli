class stack_switcher : Stack_switcher.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_stack : unit -> GStack.stack option
    method set_stack : #GStack.stack option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_stack_switcher : Stack_switcher.t
  end

