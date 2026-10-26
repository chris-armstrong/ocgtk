class type grid_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t

  method attach :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    int ->
    int ->
    int ->
    unit

  method attach_next_to :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    Enums.positiontype ->
    int ->
    int ->
    unit

  method get_baseline_row : unit -> int

  method get_child_at :
    int ->
    int ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_column_homogeneous : unit -> bool
  method get_column_spacing : unit -> int
  method get_row_baseline_position : int -> Enums.baselineposition
  method get_row_homogeneous : unit -> bool
  method get_row_spacing : unit -> int
  method insert_column : int -> unit

  method insert_next_to :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Enums.positiontype ->
    unit

  method insert_row : int -> unit

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove_column : int -> unit
  method remove_row : int -> unit
  method set_baseline_row : int -> unit
  method set_column_homogeneous : bool -> unit
  method set_column_spacing : int -> unit
  method set_row_baseline_position : int -> Enums.baselineposition -> unit
  method set_row_homogeneous : bool -> unit
  method set_row_spacing : int -> unit
  method as_grid : Raw.Grid.t
end

(* High-level class for Grid *)
class grid (obj : Raw.Grid.t) : grid_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Orientable.orientable (Raw.Orientable.from_gobject obj)

    method attach :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        int ->
        int ->
        int ->
        int ->
        unit =
      fun child column row width height ->
        let child = child#as_widget in
        Raw.Grid.attach obj child column row width height

    method attach_next_to :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
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

    method get_child_at :
        int ->
        int ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun column row ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
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

    method insert_next_to :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        Enums.positiontype ->
        unit =
      fun sibling side ->
        let sibling = sibling#as_widget in
        Raw.Grid.insert_next_to obj sibling side

    method insert_row : int -> unit =
      fun position -> Raw.Grid.insert_row obj position

    method remove :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t ->
        unit =
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
