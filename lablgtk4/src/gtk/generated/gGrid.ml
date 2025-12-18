(* High-level class for Grid *)
class grid (obj : Grid.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Grid.as_widget obj)

  method baseline_row = Grid.get_baseline_row obj
  method set_baseline_row v = Grid.set_baseline_row obj v

  method column_homogeneous = Grid.get_column_homogeneous obj
  method set_column_homogeneous v = Grid.set_column_homogeneous obj v

  method column_spacing = Grid.get_column_spacing obj
  method set_column_spacing v = Grid.set_column_spacing obj v

  method row_homogeneous = Grid.get_row_homogeneous obj
  method set_row_homogeneous v = Grid.set_row_homogeneous obj v

  method row_spacing = Grid.get_row_spacing obj
  method set_row_spacing v = Grid.set_row_spacing obj v

  method attach : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> int -> int -> int -> int -> unit =
    fun child column row width height ->
      let child = child#as_widget in
      (Grid.attach obj child column row width height)

  method attach_next_to : 'p1 'p2. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p2) option -> Gtk_enums.positiontype -> int -> int -> unit =
    fun child sibling side width height ->
      let child = child#as_widget in
      let sibling = Option.map (fun (c) -> c#as_widget) sibling in
      (Grid.attach_next_to obj child sibling side width height)

  method get_child_at : int -> int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun column row -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Grid.get_child_at obj column row)

  method get_row_baseline_position : int -> Gtk_enums.baselineposition = fun row -> (Grid.get_row_baseline_position obj row)

  method insert_column : int -> unit = fun position -> (Grid.insert_column obj position)

  method insert_next_to : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> Gtk_enums.positiontype -> unit =
    fun sibling side ->
      let sibling = sibling#as_widget in
      (Grid.insert_next_to obj sibling side)

  method insert_row : int -> unit = fun position -> (Grid.insert_row obj position)

  method remove : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) -> unit =
    fun child ->
      let child = child#as_widget in
      (Grid.remove obj child)

  method remove_column : int -> unit = fun position -> (Grid.remove_column obj position)

  method remove_row : int -> unit = fun position -> (Grid.remove_row obj position)

  method set_row_baseline_position : int -> Gtk_enums.baselineposition -> unit = fun row pos -> (Grid.set_row_baseline_position obj row pos)

  method as_widget = (Grid.as_widget obj)
    method as_grid = obj
end

