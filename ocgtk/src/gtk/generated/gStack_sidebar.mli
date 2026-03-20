class type stack_sidebar_t = object
    method get_stack : unit -> GStack.stack_t option
    method set_stack : GStack.stack_t -> unit
    method as_stack_sidebar : Stack_sidebar.t
end

class stack_sidebar : Stack_sidebar.t -> stack_sidebar_t

