class type window_controls_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_decoration_layout : unit -> string option
  method get_empty : unit -> bool
  method get_side : unit -> Enums.packtype
  method get_use_native_controls : unit -> bool
  method set_decoration_layout : string option -> unit
  method set_side : Enums.packtype -> unit
  method set_use_native_controls : bool -> unit
  method as_window_controls : Raw.Window_controls.t
end

class window_controls : Raw.Window_controls.t -> window_controls_t

val new_ : Enums.packtype -> window_controls_t
