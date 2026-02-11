(* High-level class for ContainerNode *)
class container_node (obj : Container_node.t) = object (self)

  method get_child : int -> GRender_node.render_node =
    fun idx ->
      new  GRender_node.render_node(Container_node.get_child obj idx)

  method get_n_children : unit -> int =
    fun () ->
      (Container_node.get_n_children obj)

    method as_container_node = obj
end

