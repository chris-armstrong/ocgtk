class paintable : Paintable.t ->
  object
    inherit Gpaintable_signals.paintable_signals
    method get_current_image : unit -> paintable
    method get_flags : unit -> Gdk_enums.paintableflags
    method get_intrinsic_aspect_ratio : unit -> float
    method get_intrinsic_height : unit -> int
    method get_intrinsic_width : unit -> int
    method invalidate_contents : unit -> unit
    method invalidate_size : unit -> unit
    method snapshot : #GSnapshot.snapshot -> float -> float -> unit
    method as_paintable : Paintable.t
  end

