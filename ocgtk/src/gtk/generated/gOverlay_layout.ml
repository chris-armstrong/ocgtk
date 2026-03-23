class type overlay_layout_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager_t
    method as_overlay_layout : Overlay_layout.t
end

(* High-level class for OverlayLayout *)
class overlay_layout (obj : Overlay_layout.t) : overlay_layout_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager (Obj.magic obj : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Layout_manager.t)

    method as_overlay_layout = obj
end

let new_ () : overlay_layout_t =
  new overlay_layout (Overlay_layout.new_ ())

