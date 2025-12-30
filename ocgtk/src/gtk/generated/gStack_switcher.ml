(* High-level class for StackSwitcher *)
class stack_switcher (obj : Stack_switcher.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Stack_switcher.as_widget obj)

  method get_stack : unit -> GStack.stack option =
    fun () ->
      Option.map (fun ret -> new GStack.stack ret) (Stack_switcher.get_stack obj)

  method set_stack : 'p1. (#GStack.stack as 'p1) option -> unit =
    fun stack ->
      let stack = Option.map (fun (c) -> c#as_stack) stack in
      (Stack_switcher.set_stack obj stack)

  method as_widget = (Stack_switcher.as_widget obj)
    method as_stack_switcher = obj
end

