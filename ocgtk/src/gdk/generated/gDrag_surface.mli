class type drag_surface_t = object
  method present : int -> int -> bool
  method as_drag_surface : Drag_surface.t
end

class drag_surface : Drag_surface.t -> drag_surface_t
