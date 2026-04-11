class type grid_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GOrientable.orientable_t

  method attach :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    int ->
    int ->
    int ->
    int ->
    unit

  method attach_next_to :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option ->
    Gtk_enums.positiontype ->
    int ->
    int ->
    unit

  method get_baseline_row : unit -> int

  method get_child_at :
    int ->
    int ->
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t
    option

  method get_column_homogeneous : unit -> bool
  method get_column_spacing : unit -> int
  method get_row_baseline_position : int -> Gtk_enums.baselineposition
  method get_row_homogeneous : unit -> bool
  method get_row_spacing : unit -> int
  method insert_column : int -> unit

  method insert_next_to :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    Gtk_enums.positiontype ->
    unit

  method insert_row : int -> unit

  method remove :
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t ->
    unit

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

class grid : Grid.t -> grid_t

val new_ : unit -> grid_t
