class drag_surface : Drag_surface.t ->
  object
    inherit Gdrag_surface_signals.drag_surface_signals
    method present : int -> int -> bool
    method as_drag_surface : Drag_surface.t
  end

