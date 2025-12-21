class grid_layout : Grid_layout.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager
    method get_baseline_row : unit -> int
    method get_column_homogeneous : unit -> bool
    method get_column_spacing : unit -> int
    method get_row_baseline_position : int -> Gtk_enums.baselineposition
    method get_row_homogeneous : unit -> bool
    method get_row_spacing : unit -> int
    method set_baseline_row : int -> unit
    method set_column_homogeneous : bool -> unit
    method set_column_spacing : int -> unit
    method set_row_baseline_position : int -> Gtk_enums.baselineposition -> unit
    method set_row_homogeneous : bool -> unit
    method set_row_spacing : int -> unit
  method as_layoutmanager : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t
    method as_grid_layout : Grid_layout.t
  end

