class type overlay_layout_t = object
  inherit Layout_manager.layout_manager_t

  (** {2:conversions Conversions} *)

  method as_overlay_layout : Raw.Overlay_layout.t
end

(* High-level class for OverlayLayout *)
class overlay_layout (obj : Raw.Overlay_layout.t) : overlay_layout_t =
  object (self)
    inherit Layout_manager.layout_manager (obj :> Raw.Layout_manager.t)
    method as_overlay_layout = obj
  end

let new_ () : overlay_layout_t = new overlay_layout (Raw.Overlay_layout.new_ ())
