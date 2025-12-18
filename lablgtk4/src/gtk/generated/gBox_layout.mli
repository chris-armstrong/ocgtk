class box_layout : Box_layout.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager
    method baseline_child : int
    method set_baseline_child : int -> unit
    method homogeneous : bool
    method set_homogeneous : bool -> unit
    method spacing : int
    method set_spacing : int -> unit
    method get_baseline_position : unit -> Gtk_enums.baselineposition
    method set_baseline_position : Gtk_enums.baselineposition -> unit
  method as_layoutmanager : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t
    method as_box_layout : Box_layout.t
  end

