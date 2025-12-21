(* High-level class for GridLayout *)
class grid_layout (obj : Grid_layout.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager (Grid_layout.as_layoutmanager obj)

  method get_baseline_row : unit -> int =
    fun () ->
      (Grid_layout.get_baseline_row obj)

  method get_column_homogeneous : unit -> bool =
    fun () ->
      (Grid_layout.get_column_homogeneous obj)

  method get_column_spacing : unit -> int =
    fun () ->
      (Grid_layout.get_column_spacing obj)

  method get_row_baseline_position : int -> Gtk_enums.baselineposition =
    fun row ->
      (Grid_layout.get_row_baseline_position obj row)

  method get_row_homogeneous : unit -> bool =
    fun () ->
      (Grid_layout.get_row_homogeneous obj)

  method get_row_spacing : unit -> int =
    fun () ->
      (Grid_layout.get_row_spacing obj)

  method set_baseline_row : int -> unit =
    fun row ->
      (Grid_layout.set_baseline_row obj row)

  method set_column_homogeneous : bool -> unit =
    fun homogeneous ->
      (Grid_layout.set_column_homogeneous obj homogeneous)

  method set_column_spacing : int -> unit =
    fun spacing ->
      (Grid_layout.set_column_spacing obj spacing)

  method set_row_baseline_position : int -> Gtk_enums.baselineposition -> unit =
    fun row pos ->
      (Grid_layout.set_row_baseline_position obj row pos)

  method set_row_homogeneous : bool -> unit =
    fun homogeneous ->
      (Grid_layout.set_row_homogeneous obj homogeneous)

  method set_row_spacing : int -> unit =
    fun spacing ->
      (Grid_layout.set_row_spacing obj spacing)

  method as_layoutmanager = (Grid_layout.as_layoutmanager obj)
    method as_grid_layout = obj
end

