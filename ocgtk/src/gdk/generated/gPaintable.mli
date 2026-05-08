class type paintable_t = object
  method on_invalidate_contents :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_invalidate_size :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method get_current_image : unit -> paintable_t
  method get_flags : unit -> Gdk_enums.paintableflags
  method get_intrinsic_aspect_ratio : unit -> float
  method get_intrinsic_height : unit -> int
  method get_intrinsic_width : unit -> int
  method invalidate_contents : unit -> unit
  method invalidate_size : unit -> unit
  method snapshot : GSnapshot.snapshot_t -> float -> float -> unit
  method as_paintable : Paintable.t
end

class paintable : Paintable.t -> paintable_t
