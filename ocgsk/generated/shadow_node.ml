class type shadow_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_n_shadows : unit -> Gsize.t
  method get_shadow : Gsize.t -> Raw.Shadow.t
  method as_shadow_node : Raw.Shadow_node.t
end

(* High-level class for ShadowNode *)
class shadow_node (obj : Raw.Shadow_node.t) : shadow_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_child : unit -> Render_node.render_node_t =
      fun () -> new Render_node.render_node (Raw.Shadow_node.get_child obj)

    method get_n_shadows : unit -> Gsize.t =
      fun () -> Raw.Shadow_node.get_n_shadows obj

    method get_shadow : Gsize.t -> Raw.Shadow.t =
      fun i -> Raw.Shadow_node.get_shadow obj i

    method as_shadow_node = obj
  end

let new_ (child : Render_node.render_node_t) (shadows : Raw.Shadow.t array)
    (n_shadows : Gsize.t) : shadow_node_t =
  let child = child#as_render_node in
  let obj_ = Raw.Shadow_node.new_ child shadows n_shadows in
  new shadow_node obj_
