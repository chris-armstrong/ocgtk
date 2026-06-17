class type drag_surface_size_t = object
  method set_size : int -> int -> unit
  method as_drag_surface_size : Drag_surface_size.t
end

class drag_surface_size : Drag_surface_size.t -> drag_surface_size_t
