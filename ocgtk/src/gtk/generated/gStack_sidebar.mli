class type stack_sidebar_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_stack : unit -> GStack.stack_t option
    method set_stack : GStack.stack_t -> unit
    method as_stack_sidebar : Stack_sidebar.t
end

class stack_sidebar : Stack_sidebar.t -> stack_sidebar_t

val new_ : unit -> stack_sidebar_t
