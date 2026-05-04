class type drag_surface_t = object
  method present : int -> int -> bool
  method as_drag_surface : Drag_surface.t
end

(* High-level class for DragSurface *)
class drag_surface (obj : Drag_surface.t) : drag_surface_t =
  object (self)
    method present : int -> int -> bool =
      fun width height -> Drag_surface.present obj width height

    method as_drag_surface = obj
  end
