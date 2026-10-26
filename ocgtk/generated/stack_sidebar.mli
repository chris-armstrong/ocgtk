class type stack_sidebar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_stack : unit -> Stack.stack_t option
  method set_stack : Stack.stack_t -> unit
  method as_stack_sidebar : Raw.Stack_sidebar.t
end

class stack_sidebar : Raw.Stack_sidebar.t -> stack_sidebar_t

val new_ : unit -> stack_sidebar_t
