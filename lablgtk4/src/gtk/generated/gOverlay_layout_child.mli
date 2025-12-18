class overlay_layout_child : Overlay_layout_child.t ->
  object
    method get_clip_overlay : unit -> bool
    method get_measure : unit -> bool
    method set_clip_overlay : bool -> unit
    method set_measure : bool -> unit
    method as_overlay_layout_child : Overlay_layout_child.t
  end

