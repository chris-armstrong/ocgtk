class type transform_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_transform : unit -> Transform.t
    method as_transform_node : Transform_node.t
end

(* High-level class for TransformNode *)
class transform_node (obj : Transform_node.t) : transform_node_t = object (self)
  inherit GRender_node.render_node (Obj.magic obj : Render_node.t)

  method get_child : unit -> GRender_node.render_node_t =
    fun () ->
      new  GRender_node.render_node(Transform_node.get_child obj)

  method get_transform : unit -> Transform.t =
    fun () ->
      (Transform_node.get_transform obj)

    method as_transform_node = obj
end

let new_ (child : GRender_node.render_node_t) (transform : Transform.t) : transform_node_t =
  let child = child#as_render_node in
  new transform_node (Transform_node.new_ child transform)

