(* High-level class for RoundedClipNode *)
class rounded_clip_node (obj : Rounded_clip_node.t) = object (self)

  method get_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Rounded_clip_node.get_child obj)

  method get_clip : unit -> Rounded_rect.t =
    fun () ->
      (Rounded_clip_node.get_clip obj)

    method as_rounded_clip_node = obj
end

