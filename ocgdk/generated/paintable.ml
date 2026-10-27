class type paintable_t = object
  method on_invalidate_contents :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_invalidate_size :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_current_image : unit -> paintable_t
  (** Gets an immutable paintable for the current contents displayed by
      [paintable].

      This is useful when you want to retain the current state of an animation,
      for example to take a screenshot of a running animation.

      If the [paintable] is already immutable, it will return itself. *)

  method get_flags : unit -> Enums.paintableflags
  (** Get flags for the paintable.

      This is oftentimes useful for optimizations.

      See [Gdk.PaintableFlags] for the flags and what they mean. *)

  method get_intrinsic_aspect_ratio : unit -> float
  (** Gets the preferred aspect ratio the [paintable] would like to be displayed
      at.

      The aspect ratio is the width divided by the height, so a value of 0.5
      means that the [paintable] prefers to be displayed twice as high as it is
      wide. Consumers of this interface can use this to preserve aspect ratio
      when displaying the paintable.

      This is a purely informational value and does not in any way limit the
      values that may be passed to [Gdk.Paintable.snapshot].

      Usually when a [paintable] returns nonzero values from
      [Gdk.Paintable.get_intrinsic_width] and
      [Gdk.Paintable.get_intrinsic_height] the aspect ratio should conform to
      those values, though that is not required.

      If the [paintable] does not have a preferred aspect ratio, it returns 0.
      Negative values are never returned. *)

  method get_intrinsic_height : unit -> int
  (** Gets the preferred height the [paintable] would like to be displayed at.

      Consumers of this interface can use this to reserve enough space to draw
      the paintable.

      This is a purely informational value and does not in any way limit the
      values that may be passed to [Gdk.Paintable.snapshot].

      If the [paintable] does not have a preferred height, it returns 0.
      Negative values are never returned. *)

  method get_intrinsic_width : unit -> int
  (** Gets the preferred width the [paintable] would like to be displayed at.

      Consumers of this interface can use this to reserve enough space to draw
      the paintable.

      This is a purely informational value and does not in any way limit the
      values that may be passed to [Gdk.Paintable.snapshot].

      If the [paintable] does not have a preferred width, it returns 0. Negative
      values are never returned. *)

  method invalidate_contents : unit -> unit
  (** Called by implementations of [GdkPaintable] to invalidate their contents.

      Unless the contents are invalidated, implementations must guarantee that
      multiple calls of [Gdk.Paintable.snapshot] produce the same output.

      This function will emit the [Gdk.Paintable::invalidate-contents] signal.

      If a [paintable] reports the [GDK_PAINTABLE_STATIC_CONTENTS] flag, it must
      not call this function. *)

  method invalidate_size : unit -> unit
  (** Called by implementations of [GdkPaintable] to invalidate their size.

      As long as the size is not invalidated, [paintable] must return the same
      values for its intrinsic width, height and aspect ratio.

      This function will emit the [Gdk.Paintable::invalidate-size] signal.

      If a [paintable] reports the [GDK_PAINTABLE_STATIC_SIZE] flag, it must not
      call this function. *)

  method snapshot : Snapshot.snapshot_t -> float -> float -> unit
  (** Snapshots the given paintable with the given [width] and [height].

      The paintable is drawn at the current (0,0) offset of the [snapshot]. If
      [width] and [height] are not larger than zero, this function will do
      nothing. *)

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
