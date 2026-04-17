class type clip_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_clip : unit -> Ocgtk_graphene.Graphene.Rect.rect_t
    method as_clip_node : Clip_node.t
end

(* High-level class for ClipNode *)
class clip_node (obj : Clip_node.t) : clip_node_t = object (self)
  inherit GRender_node.render_node (obj :> Render_node.t)

  method get_child : unit -> GRender_node.render_node_t =
    fun () ->
      new  GRender_node.render_node(Clip_node.get_child obj)

  method get_clip : unit -> Ocgtk_graphene.Graphene.Rect.rect_t =
    fun () ->
      new  Ocgtk_graphene.Graphene.Rect.rect(Clip_node.get_clip obj)

    method as_clip_node = obj
end

let new_ (child : GRender_node.render_node_t) (clip : Ocgtk_graphene.Graphene.Rect.rect_t) : clip_node_t =
  let child = child#as_render_node in
  let clip = clip#as_rect in
  let obj_ = Clip_node.new_ child clip in
  new clip_node obj_

