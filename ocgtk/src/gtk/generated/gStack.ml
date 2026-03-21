class type stack_t = object
    method add_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GStack_page.stack_page_t
    method add_named : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string option -> GStack_page.stack_page_t
    method add_titled : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string option -> string -> GStack_page.stack_page_t
    method get_child_by_name : string -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_hhomogeneous : unit -> bool
    method get_interpolate_size : unit -> bool
    method get_page : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GStack_page.stack_page_t
    method get_pages : unit -> GSelection_model.selection_model_t
    method get_transition_duration : unit -> int
    method get_transition_running : unit -> bool
    method get_transition_type : unit -> Gtk_enums.stacktransitiontype
    method get_vhomogeneous : unit -> bool
    method get_visible_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_visible_child_name : unit -> string option
    method remove : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method set_hhomogeneous : bool -> unit
    method set_interpolate_size : bool -> unit
    method set_transition_duration : int -> unit
    method set_transition_type : Gtk_enums.stacktransitiontype -> unit
    method set_vhomogeneous : bool -> unit
    method set_visible_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method set_visible_child_full : string -> Gtk_enums.stacktransitiontype -> unit
    method set_visible_child_name : string -> unit
    method as_stack : Stack.t
end

(* High-level class for Stack *)
class stack (obj : Stack.t) : stack_t = object (self)

  method add_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GStack_page.stack_page_t =
    fun child ->
      let child = child#as_widget in
      new  GStack_page.stack_page(Stack.add_child obj child)

  method add_named : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string option -> GStack_page.stack_page_t =
    fun child name ->
      let child = child#as_widget in
      new  GStack_page.stack_page(Stack.add_named obj child name)

  method add_titled : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> string option -> string -> GStack_page.stack_page_t =
    fun child name title ->
      let child = child#as_widget in
      new  GStack_page.stack_page(Stack.add_titled obj child name title)

  method get_child_by_name : string -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun name ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Stack.get_child_by_name obj name)

  method get_hhomogeneous : unit -> bool =
    fun () ->
      (Stack.get_hhomogeneous obj)

  method get_interpolate_size : unit -> bool =
    fun () ->
      (Stack.get_interpolate_size obj)

  method get_page : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GStack_page.stack_page_t =
    fun child ->
      let child = child#as_widget in
      new  GStack_page.stack_page(Stack.get_page obj child)

  method get_pages : unit -> GSelection_model.selection_model_t =
    fun () ->
      new  GSelection_model.selection_model(Stack.get_pages obj)

  method get_transition_duration : unit -> int =
    fun () ->
      (Stack.get_transition_duration obj)

  method get_transition_running : unit -> bool =
    fun () ->
      (Stack.get_transition_running obj)

  method get_transition_type : unit -> Gtk_enums.stacktransitiontype =
    fun () ->
      (Stack.get_transition_type obj)

  method get_vhomogeneous : unit -> bool =
    fun () ->
      (Stack.get_vhomogeneous obj)

  method get_visible_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Stack.get_visible_child obj)

  method get_visible_child_name : unit -> string option =
    fun () ->
      (Stack.get_visible_child_name obj)

  method remove : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun child ->
      let child = child#as_widget in
      (Stack.remove obj child)

  method set_hhomogeneous : bool -> unit =
    fun hhomogeneous ->
      (Stack.set_hhomogeneous obj hhomogeneous)

  method set_interpolate_size : bool -> unit =
    fun interpolate_size ->
      (Stack.set_interpolate_size obj interpolate_size)

  method set_transition_duration : int -> unit =
    fun duration ->
      (Stack.set_transition_duration obj duration)

  method set_transition_type : Gtk_enums.stacktransitiontype -> unit =
    fun transition ->
      (Stack.set_transition_type obj transition)

  method set_vhomogeneous : bool -> unit =
    fun vhomogeneous ->
      (Stack.set_vhomogeneous obj vhomogeneous)

  method set_visible_child : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun child ->
      let child = child#as_widget in
      (Stack.set_visible_child obj child)

  method set_visible_child_full : string -> Gtk_enums.stacktransitiontype -> unit =
    fun name transition ->
      (Stack.set_visible_child_full obj name transition)

  method set_visible_child_name : string -> unit =
    fun name ->
      (Stack.set_visible_child_name obj name)

    method as_stack = obj
end

