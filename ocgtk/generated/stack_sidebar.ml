class type stack_sidebar_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_stack : unit -> Stack.stack_t option
  method set_stack : Stack.stack_t -> unit
  method as_stack_sidebar : Raw.Stack_sidebar.t
end

(* High-level class for StackSidebar *)
class stack_sidebar (obj : Raw.Stack_sidebar.t) : stack_sidebar_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    method get_stack : unit -> Stack.stack_t option =
      fun () ->
        Option.map
          (fun ret -> new Stack.stack ret)
          (Raw.Stack_sidebar.get_stack obj)

    method set_stack : Stack.stack_t -> unit =
      fun stack ->
        let stack = stack#as_stack in
        Raw.Stack_sidebar.set_stack obj stack

    method as_stack_sidebar = obj
  end

let new_ () : stack_sidebar_t = new stack_sidebar (Raw.Stack_sidebar.new_ ())
