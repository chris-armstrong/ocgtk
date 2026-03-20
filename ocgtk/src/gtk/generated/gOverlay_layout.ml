class type overlay_layout_t = object
    method as_overlay_layout : Overlay_layout.t
end

(* High-level class for OverlayLayout *)
class overlay_layout (obj : Overlay_layout.t) : overlay_layout_t = object (self)

    method as_overlay_layout = obj
end

