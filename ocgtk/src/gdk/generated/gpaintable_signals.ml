(* Signal handlers for Paintable *)
class paintable_signals (obj : Paintable.t) = object
  (** Emitted when the contents of the @paintable change.

Examples for such an event would be videos changing to the next frame or
the icon theme for an icon changing. *)
  method on_invalidate_contents ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"invalidate-contents" ~callback ~after:false

  (** Emitted when the intrinsic size of the @paintable changes.

This means the values reported by at least one of
[method@Gdk.Paintable.get_intrinsic_width],
[method@Gdk.Paintable.get_intrinsic_height] or
[method@Gdk.Paintable.get_intrinsic_aspect_ratio]
has changed.

Examples for such an event would be a paintable displaying
the contents of a toplevel surface being resized. *)
  method on_invalidate_size ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"invalidate-size" ~callback ~after:false

end
