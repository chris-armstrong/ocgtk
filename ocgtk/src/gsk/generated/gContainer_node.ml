class type container_node_t = object
    inherit GRender_node.render_node_t
    method get_child : int -> GRender_node.render_node_t
    method get_n_children : unit -> int
    method as_container_node : Container_node.t
end

(* High-level class for ContainerNode *)
class container_node (obj : Container_node.t) : container_node_t = object (self)
  inherit GRender_node.render_node (obj :> Render_node.t)

  method get_child : int -> GRender_node.render_node_t =
    fun idx ->
      new  GRender_node.render_node(Container_node.get_child obj idx)

  method get_n_children : unit -> int =
    fun () ->
      (Container_node.get_n_children obj)

    method as_container_node = obj
end

let new_ (children : Render_node.t array) (n_children : int) : container_node_t =
  let obj_ = Container_node.new_ children n_children in
  new container_node obj_

