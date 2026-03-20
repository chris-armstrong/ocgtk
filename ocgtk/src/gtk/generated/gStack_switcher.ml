class type stack_switcher_t = object
    method get_stack : unit -> GStack.stack_t option
    method set_stack : GStack.stack_t option -> unit
    method as_stack_switcher : Stack_switcher.t
end

(* High-level class for StackSwitcher *)
class stack_switcher (obj : Stack_switcher.t) : stack_switcher_t = object (self)

  method get_stack : unit -> GStack.stack_t option =
    fun () ->
      Option.map (fun ret -> new GStack.stack ret) (Stack_switcher.get_stack obj)

  method set_stack : GStack.stack_t option -> unit =
    fun stack ->
      let stack = Option.map (fun (c) -> c#as_stack) stack in
      (Stack_switcher.set_stack obj stack)

    method as_stack_switcher = obj
end

