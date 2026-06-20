class type drag_surface_t = object
  method on_compute_size :
    ?after:bool ->
    callback:(size:Drag_surface_size.t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method present : int -> int -> bool
  method as_drag_surface : Drag_surface.t
end

class drag_surface : Drag_surface.t -> drag_surface_t
