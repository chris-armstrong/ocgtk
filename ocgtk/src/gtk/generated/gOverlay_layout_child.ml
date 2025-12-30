(* High-level class for OverlayLayoutChild *)
class overlay_layout_child (obj : Overlay_layout_child.t) = object (self)

  method get_clip_overlay : unit -> bool =
    fun () ->
      (Overlay_layout_child.get_clip_overlay obj)

  method get_measure : unit -> bool =
    fun () ->
      (Overlay_layout_child.get_measure obj)

  method set_clip_overlay : bool -> unit =
    fun clip_overlay ->
      (Overlay_layout_child.set_clip_overlay obj clip_overlay)

  method set_measure : bool -> unit =
    fun measure ->
      (Overlay_layout_child.set_measure obj measure)

    method as_overlay_layout_child = obj
end

