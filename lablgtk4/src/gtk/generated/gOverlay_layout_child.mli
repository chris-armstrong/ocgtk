class overlay_layout_child : Overlay_layout_child.t ->
  object
    method clip_overlay : bool
    method set_clip_overlay : bool -> unit
    method measure : bool
    method set_measure : bool -> unit
    method as_overlay_layout_child : Overlay_layout_child.t
  end

