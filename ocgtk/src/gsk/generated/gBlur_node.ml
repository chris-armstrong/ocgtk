(* High-level class for BlurNode *)
class blur_node (obj : Blur_node.t) = object (self)

  method get_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Blur_node.get_child obj)

  method get_radius : unit -> float =
    fun () ->
      (Blur_node.get_radius obj)

    method as_blur_node = obj
end

