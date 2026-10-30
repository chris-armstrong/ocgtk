class type drag_surface_t = object
  (** {2:methods Methods} *)

  method present : int -> int -> bool
  (** Present [drag_surface]. *)

  (** {2:conversions Conversions} *)

  method as_drag_surface : Raw.Drag_surface.t
end

(* High-level class for DragSurface *)
class drag_surface (obj : Raw.Drag_surface.t) : drag_surface_t =
  object (self)
    method present : int -> int -> bool =
      fun width height -> Raw.Drag_surface.present obj width height

    method as_drag_surface = obj
  end
