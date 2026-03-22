class type blur_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_radius : unit -> float
    method as_blur_node : Blur_node.t
end

(* High-level class for BlurNode *)
class blur_node (obj : Blur_node.t) : blur_node_t = object (self)
  inherit GRender_node.render_node (Obj.magic obj : Render_node.t)

  method get_child : unit -> GRender_node.render_node_t =
    fun () ->
      new  GRender_node.render_node(Blur_node.get_child obj)

  method get_radius : unit -> float =
    fun () ->
      (Blur_node.get_radius obj)

    method as_blur_node = obj
end

