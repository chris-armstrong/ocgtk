class type drag_surface_size_t = object
  (** {2:methods Methods} *)

  method set_size : int -> int -> unit
  (** Sets the size the drag surface prefers to be resized to. *)

  (** {2:conversions Conversions} *)

  method as_drag_surface_size : Raw.Drag_surface_size.t
end

(* High-level class for DragSurfaceSize *)
class drag_surface_size (obj : Raw.Drag_surface_size.t) : drag_surface_size_t =
  object (self)
    method set_size : int -> int -> unit =
      fun width height -> Raw.Drag_surface_size.set_size obj width height

    method as_drag_surface_size = obj
  end
