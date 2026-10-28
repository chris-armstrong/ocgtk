class type grid_layout_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_manager_t

  (** {2:methods Methods} *)

  method get_baseline_row : unit -> int
  (** Retrieves the row set with gtk_grid_layout_set_baseline_row(). *)

  method get_column_homogeneous : unit -> bool
  (** Checks whether all columns of [grid] should have the same width. *)

  method get_column_spacing : unit -> int
  (** Retrieves the spacing set with gtk_grid_layout_set_column_spacing(). *)

  method get_row_baseline_position : int -> Enums.baselineposition
  (** Returns the baseline position of [row].

      If no value has been set with [Gtk.GridLayout.set_row_baseline_position],
      the default value of [GTK_BASELINE_POSITION_CENTER] is returned. *)

  method get_row_homogeneous : unit -> bool
  (** Checks whether all rows of [grid] should have the same height. *)

  method get_row_spacing : unit -> int
  (** Retrieves the spacing set with gtk_grid_layout_set_row_spacing(). *)

  method set_baseline_row : int -> unit
  (** Sets which row defines the global baseline for the entire grid.

      Each row in the grid can have its own local baseline, but only one of
      those is global, meaning it will be the baseline in the parent of the
      [grid]. *)

  method set_column_homogeneous : bool -> unit
  (** Sets whether all columns of [grid] should have the same width. *)

  method set_column_spacing : int -> unit
  (** Sets the amount of space to insert between consecutive columns. *)

  method set_row_baseline_position : int -> Enums.baselineposition -> unit
  (** Sets how the baseline should be positioned on [row] of the grid, in case
      that row is assigned more space than is requested. *)

  method set_row_homogeneous : bool -> unit
  (** Sets whether all rows of [grid] should have the same height. *)

  method set_row_spacing : int -> unit
  (** Sets the amount of space to insert between consecutive rows. *)

  (** {2:conversions Conversions} *)

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
