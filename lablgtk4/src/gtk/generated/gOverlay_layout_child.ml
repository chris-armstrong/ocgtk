(* High-level class for OverlayLayoutChild *)
class overlay_layout_child (obj : Overlay_layout_child.t) = object (self)

  method clip_overlay = Overlay_layout_child.get_clip_overlay obj
  method set_clip_overlay v = Overlay_layout_child.set_clip_overlay obj v

  method measure = Overlay_layout_child.get_measure obj
  method set_measure v = Overlay_layout_child.set_measure obj v

    method as_overlay_layout_child = obj
end

