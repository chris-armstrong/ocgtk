class stack_switcher : Stack_switcher.t ->
  object
    method get_stack : unit -> GStack.stack option
    method set_stack : #GStack.stack option -> unit
    method as_stack_switcher : Stack_switcher.t
  end

