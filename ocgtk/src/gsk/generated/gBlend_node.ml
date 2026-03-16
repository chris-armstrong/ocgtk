(* High-level class for BlendNode *)
class blend_node (obj : Blend_node.t) = object (self)

  method get_blend_mode : unit -> Gsk_enums.blendmode =
    fun () ->
      (Blend_node.get_blend_mode obj)

  method get_bottom_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Blend_node.get_bottom_child obj)

  method get_top_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Blend_node.get_top_child obj)

    method as_blend_node = obj
end

