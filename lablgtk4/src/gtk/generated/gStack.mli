class stack : Stack.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method hhomogeneous : bool
    method set_hhomogeneous : bool -> unit
    method interpolate_size : bool
    method set_interpolate_size : bool -> unit
    method transition_duration : int
    method set_transition_duration : int -> unit
    method transition_running : bool
    method vhomogeneous : bool
    method set_vhomogeneous : bool -> unit
    method visible_child_name : string
    method set_visible_child_name : string -> unit
    method add_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> GStack_page.stack_page
    method add_named : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> string option -> GStack_page.stack_page
    method add_titled : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> string option -> string -> GStack_page.stack_page
    method get_child_by_name : string -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_page : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> GStack_page.stack_page
    method get_pages : unit -> GSelection_model.selection_model
    method get_transition_type : unit -> Gtk_enums.stacktransitiontype
    method get_visible_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method remove : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method set_transition_type : Gtk_enums.stacktransitiontype -> unit
    method set_visible_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method set_visible_child_full : string -> Gtk_enums.stacktransitiontype -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_stack : Stack.t
  end

