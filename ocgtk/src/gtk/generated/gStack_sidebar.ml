class type stack_sidebar_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method get_stack : unit -> GStack.stack_t option
    method set_stack : GStack.stack_t -> unit
    method as_stack_sidebar : Stack_sidebar.t
end

(* High-level class for StackSidebar *)
class stack_sidebar (obj : Stack_sidebar.t) : stack_sidebar_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)

  method get_stack : unit -> GStack.stack_t option =
    fun () ->
      Option.map (fun ret -> new GStack.stack ret) (Stack_sidebar.get_stack obj)

  method set_stack : GStack.stack_t -> unit =
    fun stack ->
      let stack = stack#as_stack in
      (Stack_sidebar.set_stack obj stack)

    method as_stack_sidebar = obj
end

