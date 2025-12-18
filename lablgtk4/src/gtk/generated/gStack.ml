(* High-level class for Stack *)
class stack (obj : Stack.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Stack.as_widget obj)

  method hhomogeneous = Stack.get_hhomogeneous obj
  method set_hhomogeneous v = Stack.set_hhomogeneous obj v

  method interpolate_size = Stack.get_interpolate_size obj
  method set_interpolate_size v = Stack.set_interpolate_size obj v

  method transition_duration = Stack.get_transition_duration obj
  method set_transition_duration v = Stack.set_transition_duration obj v

  method transition_running = Stack.get_transition_running obj

  method vhomogeneous = Stack.get_vhomogeneous obj
  method set_vhomogeneous v = Stack.set_vhomogeneous obj v

  method visible_child_name = Stack.get_visible_child_name obj
  method set_visible_child_name v = Stack.set_visible_child_name obj v

  method add_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> GStack_page.stack_page =
    fun child ->
      let child = child#as_widget in
      new  GStack_page.stack_page(Stack.add_child obj child)

  method add_named : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> string option -> GStack_page.stack_page =
    fun child name ->
      let child = child#as_widget in
      new  GStack_page.stack_page(Stack.add_named obj child name)

  method add_titled : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> string option -> string -> GStack_page.stack_page =
    fun child name title ->
      let child = child#as_widget in
      new  GStack_page.stack_page(Stack.add_titled obj child name title)

  method get_child_by_name : string -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun name -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Stack.get_child_by_name obj name)

  method get_page : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> GStack_page.stack_page =
    fun child ->
      let child = child#as_widget in
      new  GStack_page.stack_page(Stack.get_page obj child)

  method get_pages : unit -> GSelection_model.selection_model = fun () -> new  GSelection_model.selection_model(Stack.get_pages obj )

  method get_transition_type : unit -> Gtk_enums.stacktransitiontype = fun () -> (Stack.get_transition_type obj )

  method get_visible_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Stack.get_visible_child obj )

  method remove : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (Stack.remove obj child)

  method set_transition_type : Gtk_enums.stacktransitiontype -> unit = fun transition -> (Stack.set_transition_type obj transition)

  method set_visible_child : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (Stack.set_visible_child obj child)

  method set_visible_child_full : string -> Gtk_enums.stacktransitiontype -> unit = fun name transition -> (Stack.set_visible_child_full obj name transition)

  method as_widget = (Stack.as_widget obj)
    method as_stack = obj
end

