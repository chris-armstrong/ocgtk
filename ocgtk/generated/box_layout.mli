class type box_layout_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_manager_t

  inherit Orientable.orientable_t
  method get_baseline_child : unit -> int
  method get_baseline_position : unit -> Enums.baselineposition
  method get_homogeneous : unit -> bool
  method get_spacing : unit -> int
  method set_baseline_child : int -> unit
  method set_baseline_position : Enums.baselineposition -> unit
  method set_homogeneous : bool -> unit
  method set_spacing : int -> unit
  method as_box_layout : Raw.Box_layout.t
end

class box_layout : Raw.Box_layout.t -> box_layout_t

val new_ : Enums.orientation -> box_layout_t
