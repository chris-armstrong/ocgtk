class type grid_t = object
  inherit Widget.widget_t
  inherit Orientable.orientable_t

  (** {2:methods Methods} *)

  method attach : Widget.widget_t -> int -> int -> int -> int -> unit
  (** Adds a widget to the grid.

      The position of [child] is determined by [column] and [row]. The number of
      “cells” that [child] will occupy is determined by [width] and [height]. *)

  method attach_next_to :
    Widget.widget_t ->
    Widget.widget_t option ->
    Enums.positiontype ->
    int ->
    int ->
    unit
  (** Adds a widget to the grid.

      The widget is placed next to [sibling], on the side determined by [side].
      When [sibling] is [NULL], the widget is placed in row (for left or right
      placement) or column 0 (for top or bottom placement), at the end indicated
      by [side].

      Attaching widgets labeled \[1\], \[2\], \[3\] with [@sibling == %NULL] and
      [@side == %GTK_POS_LEFT] yields a layout of \[3\]\[2\]\[1\]. *)

  method get_baseline_row : unit -> int
  (** Returns which row defines the global baseline of [grid]. *)

  method get_child_at : int -> int -> Widget.widget_t option
  (** Gets the child of [grid] whose area covers the grid cell at [column],
      [row]. *)

  method get_column_homogeneous : unit -> bool
  (** Returns whether all columns of [grid] have the same width. *)

  method get_column_spacing : unit -> int
  (** Returns the amount of space between the columns of [grid]. *)

  method get_row_baseline_position : int -> Enums.baselineposition
  (** Returns the baseline position of [row].

      See [Gtk.Grid.set_row_baseline_position]. *)

  method get_row_homogeneous : unit -> bool
  (** Returns whether all rows of [grid] have the same height. *)

  method get_row_spacing : unit -> int
  (** Returns the amount of space between the rows of [grid]. *)

  method insert_column : int -> unit
  (** Inserts a column at the specified position.

      Children which are attached at or to the right of this position are moved
      one column to the right. Children which span across this position are
      grown to span the new column. *)

  method insert_next_to : Widget.widget_t -> Enums.positiontype -> unit
  (** Inserts a row or column at the specified position.

      The new row or column is placed next to [sibling], on the side determined
      by [side]. If [side] is [GTK_POS_TOP] or [GTK_POS_BOTTOM], a row is
      inserted. If [side] is [GTK_POS_LEFT] of [GTK_POS_RIGHT], a column is
      inserted. *)

  method insert_row : int -> unit
  (** Inserts a row at the specified position.

      Children which are attached at or below this position are moved one row
      down. Children which span across this position are grown to span the new
      row. *)

  method remove : Widget.widget_t -> unit
  (** Removes a child from [grid].

      The child must have been added with [Gtk.Grid.attach] or
      [Gtk.Grid.attach_next_to]. *)

  method remove_column : int -> unit
  (** Removes a column from the grid.

      Children that are placed in this column are removed, spanning children
      that overlap this column have their width reduced by one, and children
      after the column are moved to the left. *)

  method remove_row : int -> unit
  (** Removes a row from the grid.

      Children that are placed in this row are removed, spanning children that
      overlap this row have their height reduced by one, and children below the
      row are moved up. *)

  method set_baseline_row : int -> unit
  (** Sets which row defines the global baseline for the entire grid.

      Each row in the grid can have its own local baseline, but only one of
      those is global, meaning it will be the baseline in the parent of the
      [grid]. *)

  method set_column_homogeneous : bool -> unit
  (** Sets whether all columns of [grid] will have the same width. *)

  method set_column_spacing : int -> unit
  (** Sets the amount of space between columns of [grid]. *)

  method set_row_baseline_position : int -> Enums.baselineposition -> unit
  (** Sets how the baseline should be positioned on [row] of the grid, in case
      that row is assigned more space than is requested.

      The default baseline position is [GTK_BASELINE_POSITION_CENTER]. *)

  method set_row_homogeneous : bool -> unit
  (** Sets whether all rows of [grid] will have the same height. *)

  method set_row_spacing : int -> unit
  (** Sets the amount of space between rows of [grid]. *)

  (** {2:conversions Conversions} *)

  method as_grid : Raw.Grid.t
end

(* High-level class for Grid *)
class grid (obj : Raw.Grid.t) : grid_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)
    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method attach : Widget.widget_t -> int -> int -> int -> int -> unit =
      fun child column row width height ->
        let child = child#as_widget in
        Raw.Grid.attach obj child column row width height

    method attach_next_to :
        Widget.widget_t ->
        Widget.widget_t option ->
        Enums.positiontype ->
        int ->
        int ->
        unit =
      fun child sibling side width height ->
        let child = child#as_widget in
        let sibling = Option.map (fun c -> c#as_widget) sibling in
        Raw.Grid.attach_next_to obj child sibling side width height

    method get_baseline_row : unit -> int =
      fun () -> Raw.Grid.get_baseline_row obj

    method get_child_at : int -> int -> Widget.widget_t option =
      fun column row ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Grid.get_child_at obj column row)

    method get_column_homogeneous : unit -> bool =
      fun () -> Raw.Grid.get_column_homogeneous obj

    method get_column_spacing : unit -> int =
      fun () -> Raw.Grid.get_column_spacing obj

    method get_row_baseline_position : int -> Enums.baselineposition =
      fun row -> Raw.Grid.get_row_baseline_position obj row

    method get_row_homogeneous : unit -> bool =
      fun () -> Raw.Grid.get_row_homogeneous obj

    method get_row_spacing : unit -> int =
      fun () -> Raw.Grid.get_row_spacing obj

    method insert_column : int -> unit =
      fun position -> Raw.Grid.insert_column obj position

    method insert_next_to : Widget.widget_t -> Enums.positiontype -> unit =
      fun sibling side ->
        let sibling = sibling#as_widget in
        Raw.Grid.insert_next_to obj sibling side

    method insert_row : int -> unit =
      fun position -> Raw.Grid.insert_row obj position

    method remove : Widget.widget_t -> unit =
      fun child ->
        let child = child#as_widget in
        Raw.Grid.remove obj child

    method remove_column : int -> unit =
      fun position -> Raw.Grid.remove_column obj position

    method remove_row : int -> unit =
      fun position -> Raw.Grid.remove_row obj position

    method set_baseline_row : int -> unit =
      fun row -> Raw.Grid.set_baseline_row obj row

    method set_column_homogeneous : bool -> unit =
      fun homogeneous -> Raw.Grid.set_column_homogeneous obj homogeneous

    method set_column_spacing : int -> unit =
      fun spacing -> Raw.Grid.set_column_spacing obj spacing

    method set_row_baseline_position : int -> Enums.baselineposition -> unit =
      fun row pos -> Raw.Grid.set_row_baseline_position obj row pos

    method set_row_homogeneous : bool -> unit =
      fun homogeneous -> Raw.Grid.set_row_homogeneous obj homogeneous

    method set_row_spacing : int -> unit =
      fun spacing -> Raw.Grid.set_row_spacing obj spacing

    method as_grid = obj
  end

let new_ () : grid_t = new grid (Raw.Grid.new_ ())
