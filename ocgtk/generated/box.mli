class type box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t

  method append :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method get_baseline_child : unit -> int
  method get_baseline_position : unit -> Enums.baselineposition
  method get_homogeneous : unit -> bool
  method get_spacing : unit -> int

  method insert_child_after :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method prepend :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method reorder_child_after :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_baseline_child : int -> unit
  method set_baseline_position : Enums.baselineposition -> unit
  method set_homogeneous : bool -> unit
  method set_spacing : int -> unit
  method as_box : Raw.Box.t
end

class box : Raw.Box.t -> box_t

val new_ : Enums.orientation -> int -> box_t
