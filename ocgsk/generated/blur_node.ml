class type blur_node_t = object
  inherit Render_node.render_node_t

  method get_child : unit -> Render_node.render_node_t
  (** Retrieves the child [GskRenderNode] of the blur [node]. *)

  method get_radius : unit -> float
  (** Retrieves the blur radius of the [node]. *)

  method as_blur_node : Raw.Blur_node.t
end

(* High-level class for BlurNode *)
class blur_node (obj : Raw.Blur_node.t) : blur_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_child : unit -> Render_node.render_node_t =
      fun () -> new Render_node.render_node (Raw.Blur_node.get_child obj)

    method get_radius : unit -> float = fun () -> Raw.Blur_node.get_radius obj
    method as_blur_node = obj
  end

let new_ (child : Render_node.render_node_t) (radius : float) : blur_node_t =
  let child = child#as_render_node in
  let obj_ = Raw.Blur_node.new_ child radius in
  new blur_node obj_
