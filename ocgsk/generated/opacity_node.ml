class type opacity_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_opacity : unit -> float
  method as_opacity_node : Raw.Opacity_node.t
end

(* High-level class for OpacityNode *)
class opacity_node (obj : Raw.Opacity_node.t) : opacity_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_child : unit -> Render_node.render_node_t =
      fun () -> new Render_node.render_node (Raw.Opacity_node.get_child obj)

    method get_opacity : unit -> float =
      fun () -> Raw.Opacity_node.get_opacity obj

    method as_opacity_node = obj
  end

let new_ (child : Render_node.render_node_t) (opacity : float) : opacity_node_t
    =
  let child = child#as_render_node in
  let obj_ = Raw.Opacity_node.new_ child opacity in
  new opacity_node obj_
