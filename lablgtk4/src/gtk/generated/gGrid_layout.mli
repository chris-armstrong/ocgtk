class grid_layout : Grid_layout.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager
    method baseline_row : int
    method set_baseline_row : int -> unit
    method column_homogeneous : bool
    method set_column_homogeneous : bool -> unit
    method column_spacing : int
    method set_column_spacing : int -> unit
    method row_homogeneous : bool
    method set_row_homogeneous : bool -> unit
    method row_spacing : int
    method set_row_spacing : int -> unit
    method get_row_baseline_position : int -> Gtk_enums.baselineposition
    method set_row_baseline_position : int -> Gtk_enums.baselineposition -> unit
  method as_layoutmanager : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t
    method as_grid_layout : Grid_layout.t
  end

