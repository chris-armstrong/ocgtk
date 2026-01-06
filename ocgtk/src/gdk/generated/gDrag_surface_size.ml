(* High-level class for DragSurfaceSize *)
class drag_surface_size (obj : Drag_surface_size.t) = object (self)

  method set_size : int -> int -> unit =
    fun width height ->
      (Drag_surface_size.set_size obj width height)

    method as_drag_surface_size = obj
end

