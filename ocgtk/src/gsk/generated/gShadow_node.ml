class type shadow_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_n_shadows : unit -> int
    method get_shadow : int -> Shadow.t
    method as_shadow_node : Shadow_node.t
end

(* High-level class for ShadowNode *)
class shadow_node (obj : Shadow_node.t) : shadow_node_t = object (self)
  inherit GRender_node.render_node (obj :> Render_node.t)

  method get_child : unit -> GRender_node.render_node_t =
    fun () ->
      new  GRender_node.render_node(Shadow_node.get_child obj)

  method get_n_shadows : unit -> int =
    fun () ->
      (Shadow_node.get_n_shadows obj)

  method get_shadow : int -> Shadow.t =
    fun i ->
      (Shadow_node.get_shadow obj i)

    method as_shadow_node = obj
end

let new_ (child : GRender_node.render_node_t) (shadows : Shadow.t array) (n_shadows : int) : shadow_node_t =
  let child = child#as_render_node in
  let obj_ = Shadow_node.new_ child shadows n_shadows in
  new shadow_node obj_

