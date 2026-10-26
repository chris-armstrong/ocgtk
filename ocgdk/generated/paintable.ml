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

(* High-level class for Paintable *)
class paintable (obj : Raw.Paintable.t) : paintable_t =
  object (self)
    method on_invalidate_contents ?(after = false) ~callback () =
      Raw.Paintable.on_invalidate_contents ~after self#as_paintable ~callback

    method on_invalidate_size ?(after = false) ~callback () =
      Raw.Paintable.on_invalidate_size ~after self#as_paintable ~callback

    method get_current_image : unit -> paintable_t =
      fun () -> new paintable (Raw.Paintable.get_current_image obj)

    method get_flags : unit -> Enums.paintableflags =
      fun () -> Raw.Paintable.get_flags obj

    method get_intrinsic_aspect_ratio : unit -> float =
      fun () -> Raw.Paintable.get_intrinsic_aspect_ratio obj

    method get_intrinsic_height : unit -> int =
      fun () -> Raw.Paintable.get_intrinsic_height obj

    method get_intrinsic_width : unit -> int =
      fun () -> Raw.Paintable.get_intrinsic_width obj

    method invalidate_contents : unit -> unit =
      fun () -> Raw.Paintable.invalidate_contents obj

    method invalidate_size : unit -> unit =
      fun () -> Raw.Paintable.invalidate_size obj

    method snapshot : Snapshot.snapshot_t -> float -> float -> unit =
      fun snapshot width height ->
        let snapshot = snapshot#as_snapshot in
        Raw.Paintable.snapshot obj snapshot width height

    method as_paintable = obj
  end
