class type stack_sidebar_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_stack : unit -> Stack.stack_t option
  (** Retrieves the stack. *)

  method set_stack : Stack.stack_t -> unit
  (** Set the [GtkStack] associated with this [GtkStackSidebar].

      The sidebar widget will automatically update according to the order and
      items within the given [GtkStack]. *)

  (** {2:conversions Conversions} *)

  method as_stack_sidebar : Raw.Stack_sidebar.t
end

(* High-level class for StackSidebar *)
class stack_sidebar (obj : Raw.Stack_sidebar.t) : stack_sidebar_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

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
