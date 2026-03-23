class type rounded_clip_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_clip : unit -> Rounded_rect.t
    method as_rounded_clip_node : Rounded_clip_node.t
end

(* High-level class for RoundedClipNode *)
class rounded_clip_node (obj : Rounded_clip_node.t) : rounded_clip_node_t = object (self)
  inherit GRender_node.render_node (Obj.magic obj : Render_node.t)

  method get_child : unit -> GRender_node.render_node_t =
    fun () ->
      new  GRender_node.render_node(Rounded_clip_node.get_child obj)

  method get_clip : unit -> Rounded_rect.t =
    fun () ->
      (Rounded_clip_node.get_clip obj)

    method as_rounded_clip_node = obj
end

let new_ (child : GRender_node.render_node_t) (clip : Rounded_rect.t) : rounded_clip_node_t =
  let child = child#as_render_node in
  new rounded_clip_node (Rounded_clip_node.new_ child clip)

