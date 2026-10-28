class type stack_switcher_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t

  (** {2:methods Methods} *)

  method get_stack : unit -> Stack.stack_t option
  (** Retrieves the stack. *)

  method set_stack : Stack.stack_t option -> unit
  (** Sets the stack to control. *)

  (** {2:conversions Conversions} *)

  method as_stack_switcher : Raw.Stack_switcher.t
end

(* High-level class for StackSwitcher *)
class stack_switcher (obj : Raw.Stack_switcher.t) : stack_switcher_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method get_stack : unit -> Stack.stack_t option =
      fun () ->
        Option.map
          (fun ret -> new Stack.stack ret)
          (Raw.Stack_switcher.get_stack obj)

    method set_stack : Stack.stack_t option -> unit =
      fun stack ->
        let stack = Option.map (fun c -> c#as_stack) stack in
        Raw.Stack_switcher.set_stack obj stack

    method as_stack_switcher = obj
  end

let new_ () : stack_switcher_t = new stack_switcher (Raw.Stack_switcher.new_ ())
