class type stack_switcher_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit GOrientable.orientable_t
    method get_stack : unit -> GStack.stack_t option
    method set_stack : GStack.stack_t option -> unit
    method as_stack_switcher : Stack_switcher.t
end

class stack_switcher : Stack_switcher.t -> stack_switcher_t

val new_ : unit -> stack_switcher_t
