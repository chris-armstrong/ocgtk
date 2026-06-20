class type drag_surface_t = object
  method on_compute_size :
    ?after:bool ->
    callback:(size:Drag_surface_size.t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method present : int -> int -> bool
  method as_drag_surface : Drag_surface.t
end

(* High-level class for DragSurface *)
class drag_surface (obj : Drag_surface.t) : drag_surface_t =
  object (self)
    method on_compute_size ?(after = false) ~callback () =
      Drag_surface.on_compute_size ~after self#as_drag_surface ~callback

    method present : int -> int -> bool =
      fun width height -> Drag_surface.present obj width height

    method as_drag_surface = obj
  end
