class drag_surface_size : Drag_surface_size.t ->
  object
    method set_size : int -> int -> unit
    method as_drag_surface_size : Drag_surface_size.t
  end

