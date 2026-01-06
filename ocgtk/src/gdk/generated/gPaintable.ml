(* Signal class defined in gpaintable_signals.ml *)

(* High-level class for Paintable *)
class paintable (obj : Paintable.t) = object (self)
  inherit Gpaintable_signals.paintable_signals obj

  method get_current_image : unit -> paintable =
    fun () ->
      new  paintable(Paintable.get_current_image obj)

  method get_flags : unit -> Gdk_enums.paintableflags =
    fun () ->
      (Paintable.get_flags obj)

  method get_intrinsic_aspect_ratio : unit -> float =
    fun () ->
      (Paintable.get_intrinsic_aspect_ratio obj)

  method get_intrinsic_height : unit -> int =
    fun () ->
      (Paintable.get_intrinsic_height obj)

  method get_intrinsic_width : unit -> int =
    fun () ->
      (Paintable.get_intrinsic_width obj)

  method invalidate_contents : unit -> unit =
    fun () ->
      (Paintable.invalidate_contents obj)

  method invalidate_size : unit -> unit =
    fun () ->
      (Paintable.invalidate_size obj)

  method snapshot : 'p1. (#GSnapshot.snapshot as 'p1) -> float -> float -> unit =
    fun snapshot width height ->
      let snapshot = snapshot#as_snapshot in
      (Paintable.snapshot obj snapshot width height)

    method as_paintable = obj
end

