class type grid_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit GOrientable.orientable_t
    method attach : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int -> int -> int -> int -> unit
    method attach_next_to : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> Gtk_enums.positiontype -> int -> int -> unit
    method get_baseline_row : unit -> int
    method get_child_at : int -> int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_column_homogeneous : unit -> bool
    method get_column_spacing : unit -> int
    method get_row_baseline_position : int -> Gtk_enums.baselineposition
    method get_row_homogeneous : unit -> bool
    method get_row_spacing : unit -> int
    method insert_column : int -> unit
    method insert_next_to : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Gtk_enums.positiontype -> unit
    method insert_row : int -> unit
    method remove : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit
    method remove_column : int -> unit
    method remove_row : int -> unit
    method set_baseline_row : int -> unit
    method set_column_homogeneous : bool -> unit
    method set_column_spacing : int -> unit
    method set_row_baseline_position : int -> Gtk_enums.baselineposition -> unit
    method set_row_homogeneous : bool -> unit
    method set_row_spacing : int -> unit
    method as_grid : Grid.t
end

(* High-level class for Grid *)
class grid (obj : Grid.t) : grid_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit GOrientable.orientable (Orientable.from_gobject obj)

  method attach : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> int -> int -> int -> int -> unit =
    fun child column row width height ->
      let child = child#as_widget in
      (Grid.attach obj child column row width height)

  method attach_next_to : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> Gtk_enums.positiontype -> int -> int -> unit =
    fun child sibling side width height ->
      let child = child#as_widget in
      let sibling = Option.map (fun (c) -> c#as_widget) sibling in
      (Grid.attach_next_to obj child sibling side width height)

  method get_baseline_row : unit -> int =
    fun () ->
      (Grid.get_baseline_row obj)

  method get_child_at : int -> int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option =
    fun column row ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Grid.get_child_at obj column row)

  method get_column_homogeneous : unit -> bool =
    fun () ->
      (Grid.get_column_homogeneous obj)

  method get_column_spacing : unit -> int =
    fun () ->
      (Grid.get_column_spacing obj)

  method get_row_baseline_position : int -> Gtk_enums.baselineposition =
    fun row ->
      (Grid.get_row_baseline_position obj row)

  method get_row_homogeneous : unit -> bool =
    fun () ->
      (Grid.get_row_homogeneous obj)

  method get_row_spacing : unit -> int =
    fun () ->
      (Grid.get_row_spacing obj)

  method insert_column : int -> unit =
    fun position ->
      (Grid.insert_column obj position)

  method insert_next_to : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> Gtk_enums.positiontype -> unit =
    fun sibling side ->
      let sibling = sibling#as_widget in
      (Grid.insert_next_to obj sibling side)

  method insert_row : int -> unit =
    fun position ->
      (Grid.insert_row obj position)

  method remove : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t -> unit =
    fun child ->
      let child = child#as_widget in
      (Grid.remove obj child)

  method remove_column : int -> unit =
    fun position ->
      (Grid.remove_column obj position)

  method remove_row : int -> unit =
    fun position ->
      (Grid.remove_row obj position)

  method set_baseline_row : int -> unit =
    fun row ->
      (Grid.set_baseline_row obj row)

  method set_column_homogeneous : bool -> unit =
    fun homogeneous ->
      (Grid.set_column_homogeneous obj homogeneous)

  method set_column_spacing : int -> unit =
    fun spacing ->
      (Grid.set_column_spacing obj spacing)

  method set_row_baseline_position : int -> Gtk_enums.baselineposition -> unit =
    fun row pos ->
      (Grid.set_row_baseline_position obj row pos)

  method set_row_homogeneous : bool -> unit =
    fun homogeneous ->
      (Grid.set_row_homogeneous obj homogeneous)

  method set_row_spacing : int -> unit =
    fun spacing ->
      (Grid.set_row_spacing obj spacing)

    method as_grid = obj
end

let new_ () : grid_t =
  new grid (Grid.new_ ())

