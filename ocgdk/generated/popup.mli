class type popup_t = object
  method get_autohide : unit -> bool
  method get_parent : unit -> App_launch_context_cycle_de440b34.surface_t option
  method get_position_x : unit -> int
  method get_position_y : unit -> int
  method get_rect_anchor : unit -> Enums.gravity
  method get_surface_anchor : unit -> Enums.gravity
  method present : int -> int -> Raw.Popup_layout.t -> bool
  method as_popup : Raw.Popup.t
end

class popup : Raw.Popup.t -> popup_t
