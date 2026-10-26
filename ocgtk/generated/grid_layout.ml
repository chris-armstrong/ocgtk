class type grid_layout_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_manager_t

  method get_baseline_row : unit -> int
  method get_column_homogeneous : unit -> bool
  method get_column_spacing : unit -> int
  method get_row_baseline_position : int -> Enums.baselineposition
  method get_row_homogeneous : unit -> bool
  method get_row_spacing : unit -> int
  method set_baseline_row : int -> unit
  method set_column_homogeneous : bool -> unit
  method set_column_spacing : int -> unit
  method set_row_baseline_position : int -> Enums.baselineposition -> unit
  method set_row_homogeneous : bool -> unit
  method set_row_spacing : int -> unit
  method as_grid_layout : Raw.Grid_layout.t
end

(* High-level class for GridLayout *)
class grid_layout (obj : Raw.Grid_layout.t) : grid_layout_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .layout_manager
        (obj :> Raw.Layout_manager.t)

    method get_baseline_row : unit -> int =
      fun () -> Raw.Grid_layout.get_baseline_row obj

    method get_column_homogeneous : unit -> bool =
      fun () -> Raw.Grid_layout.get_column_homogeneous obj

    method get_column_spacing : unit -> int =
      fun () -> Raw.Grid_layout.get_column_spacing obj

    method get_row_baseline_position : int -> Enums.baselineposition =
      fun row -> Raw.Grid_layout.get_row_baseline_position obj row

    method get_row_homogeneous : unit -> bool =
      fun () -> Raw.Grid_layout.get_row_homogeneous obj

    method get_row_spacing : unit -> int =
      fun () -> Raw.Grid_layout.get_row_spacing obj

    method set_baseline_row : int -> unit =
      fun row -> Raw.Grid_layout.set_baseline_row obj row

    method set_column_homogeneous : bool -> unit =
      fun homogeneous -> Raw.Grid_layout.set_column_homogeneous obj homogeneous

    method set_column_spacing : int -> unit =
      fun spacing -> Raw.Grid_layout.set_column_spacing obj spacing

    method set_row_baseline_position : int -> Enums.baselineposition -> unit =
      fun row pos -> Raw.Grid_layout.set_row_baseline_position obj row pos

    method set_row_homogeneous : bool -> unit =
      fun homogeneous -> Raw.Grid_layout.set_row_homogeneous obj homogeneous

    method set_row_spacing : int -> unit =
      fun spacing -> Raw.Grid_layout.set_row_spacing obj spacing

    method as_grid_layout = obj
  end

let new_ () : grid_layout_t = new grid_layout (Raw.Grid_layout.new_ ())
