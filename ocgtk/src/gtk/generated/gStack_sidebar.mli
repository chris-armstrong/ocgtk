class stack_sidebar : Stack_sidebar.t ->
  object
    method get_stack : unit -> GStack.stack option
    method set_stack : #GStack.stack -> unit
    method as_stack_sidebar : Stack_sidebar.t
  end

