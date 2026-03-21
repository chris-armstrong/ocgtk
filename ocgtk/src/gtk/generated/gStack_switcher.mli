class type stack_switcher_t = object
    method get_stack : unit -> GStack.stack_t option
    method set_stack : GStack.stack_t option -> unit
    method as_stack_switcher : Stack_switcher.t
end

class stack_switcher : Stack_switcher.t -> stack_switcher_t

