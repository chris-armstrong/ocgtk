(* High-level class for StackSidebar *)
class stack_sidebar (obj : Stack_sidebar.t) = object (self)

  method get_stack : unit -> GStack.stack option =
    fun () ->
      Option.map (fun ret -> new GStack.stack ret) (Stack_sidebar.get_stack obj)

  method set_stack : 'p1. (#GStack.stack as 'p1) -> unit =
    fun stack ->
      let stack = stack#as_stack in
      (Stack_sidebar.set_stack obj stack)

    method as_stack_sidebar = obj
end

