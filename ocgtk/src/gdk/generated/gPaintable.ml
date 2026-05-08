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

(* High-level class for Paintable *)
class paintable (obj : Paintable.t) : paintable_t =
  object (self)
    method on_invalidate_contents ~callback =
      Paintable.on_invalidate_contents self#as_paintable ~callback

    method on_invalidate_size ~callback =
      Paintable.on_invalidate_size self#as_paintable ~callback

    method get_current_image : unit -> paintable_t =
      fun () -> new paintable (Paintable.get_current_image obj)

    method get_flags : unit -> Gdk_enums.paintableflags =
      fun () -> Paintable.get_flags obj

    method get_intrinsic_aspect_ratio : unit -> float =
      fun () -> Paintable.get_intrinsic_aspect_ratio obj

    method get_intrinsic_height : unit -> int =
      fun () -> Paintable.get_intrinsic_height obj

    method get_intrinsic_width : unit -> int =
      fun () -> Paintable.get_intrinsic_width obj

    method invalidate_contents : unit -> unit =
      fun () -> Paintable.invalidate_contents obj

    method invalidate_size : unit -> unit =
      fun () -> Paintable.invalidate_size obj

    method snapshot : GSnapshot.snapshot_t -> float -> float -> unit =
      fun snapshot width height ->
        let snapshot = snapshot#as_snapshot in
        Paintable.snapshot obj snapshot width height

    method as_paintable = obj
  end
