class type popup_t = object
  method get_autohide : unit -> bool

  method get_parent :
    unit -> GApp_launch_context_cycle_de440b34.surface_t option

  method get_position_x : unit -> int
  method get_position_y : unit -> int
  method get_rect_anchor : unit -> Gdk_enums.gravity
  method get_surface_anchor : unit -> Gdk_enums.gravity
  method present : int -> int -> Popup_layout.t -> bool
  method as_popup : Popup.t
end

class popup : Popup.t -> popup_t
