class type opacity_node_t = object
    method get_child : unit -> GRender_node.render_node_t
    method get_opacity : unit -> float
    method as_opacity_node : Opacity_node.t
end

(* High-level class for OpacityNode *)
class opacity_node (obj : Opacity_node.t) : opacity_node_t = object (self)

  method get_child : unit -> GRender_node.render_node_t =
    fun () ->
      new  GRender_node.render_node(Opacity_node.get_child obj)

  method get_opacity : unit -> float =
    fun () ->
      (Opacity_node.get_opacity obj)

    method as_opacity_node = obj
end

