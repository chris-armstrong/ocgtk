class type drag_surface_size_t = object
    method set_size : int -> int -> unit
    method as_drag_surface_size : Drag_surface_size.t
end

(* High-level class for DragSurfaceSize *)
class drag_surface_size (obj : Drag_surface_size.t) : drag_surface_size_t = object (self)

  method set_size : int -> int -> unit =
    fun width height ->
      (Drag_surface_size.set_size obj width height)

    method as_drag_surface_size = obj
end

