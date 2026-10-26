class type paintable_t = object
  method on_invalidate_contents :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_invalidate_size :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_current_image : unit -> paintable_t
  method get_flags : unit -> Enums.paintableflags
  method get_intrinsic_aspect_ratio : unit -> float
  method get_intrinsic_height : unit -> int
  method get_intrinsic_width : unit -> int
  method invalidate_contents : unit -> unit
  method invalidate_size : unit -> unit
  method snapshot : Snapshot.snapshot_t -> float -> float -> unit
  method as_paintable : Raw.Paintable.t
end

class paintable : Raw.Paintable.t -> paintable_t
