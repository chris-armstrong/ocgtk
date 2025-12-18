class grid : Grid.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
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
    method attach : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> int -> int -> int -> int -> unit
    method attach_next_to : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> Gtk_enums.positiontype -> int -> int -> unit
    method get_child_at : int -> int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_row_baseline_position : int -> Gtk_enums.baselineposition
    method insert_column : int -> unit
    method insert_next_to : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> Gtk_enums.positiontype -> unit
    method insert_row : int -> unit
    method remove : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method remove_column : int -> unit
    method remove_row : int -> unit
    method set_row_baseline_position : int -> Gtk_enums.baselineposition -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_grid : Grid.t
  end

