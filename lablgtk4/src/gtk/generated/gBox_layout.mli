class box_layout : Box_layout.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager
    method get_baseline_child : unit -> int
    method get_baseline_position : unit -> Gtk_enums.baselineposition
    method get_homogeneous : unit -> bool
    method get_spacing : unit -> int
    method set_baseline_child : int -> unit
    method set_baseline_position : Gtk_enums.baselineposition -> unit
    method set_homogeneous : bool -> unit
    method set_spacing : int -> unit
  method as_layoutmanager : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t
    method as_box_layout : Box_layout.t
  end

