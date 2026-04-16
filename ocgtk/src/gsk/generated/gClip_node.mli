class type clip_node_t = object
  inherit GRender_node.render_node_t
  method get_child : unit -> GRender_node.render_node_t
  method get_clip : unit -> Ocgtk_graphene.Graphene.Rect.rect_t
  method as_clip_node : Clip_node.t
end

class clip_node : Clip_node.t -> clip_node_t

val new_ :
  GRender_node.render_node_t ->
  Ocgtk_graphene.Graphene.Rect.rect_t ->
  clip_node_t
