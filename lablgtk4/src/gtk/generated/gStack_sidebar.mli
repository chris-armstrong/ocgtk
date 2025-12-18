class stack_sidebar : Stack_sidebar.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_stack : unit -> GStack.stack option
    method set_stack : #GStack.stack -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_stack_sidebar : Stack_sidebar.t
  end

