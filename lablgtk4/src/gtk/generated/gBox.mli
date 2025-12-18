class box : Box.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method baseline_child : int
    method set_baseline_child : int -> unit
    method homogeneous : bool
    method set_homogeneous : bool -> unit
    method spacing : int
    method set_spacing : int -> unit
    method append : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method get_baseline_position : unit -> Gtk_enums.baselineposition
    method insert_child_after : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method prepend : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method remove : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method reorder_child_after : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_baseline_position : Gtk_enums.baselineposition -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_box : Box.t
  end

