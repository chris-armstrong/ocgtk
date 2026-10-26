class type blend_node_t = object
  inherit Render_node.render_node_t
  method get_blend_mode : unit -> Enums.blendmode
  method get_bottom_child : unit -> Render_node.render_node_t
  method get_top_child : unit -> Render_node.render_node_t
  method as_blend_node : Raw.Blend_node.t
end

(* High-level class for BlendNode *)
class blend_node (obj : Raw.Blend_node.t) : blend_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_blend_mode : unit -> Enums.blendmode =
      fun () -> Raw.Blend_node.get_blend_mode obj

    method get_bottom_child : unit -> Render_node.render_node_t =
      fun () ->
        new Render_node.render_node (Raw.Blend_node.get_bottom_child obj)

    method get_top_child : unit -> Render_node.render_node_t =
      fun () -> new Render_node.render_node (Raw.Blend_node.get_top_child obj)

    method as_blend_node = obj
  end

let new_ (bottom : Render_node.render_node_t) (top : Render_node.render_node_t)
    (blend_mode : Enums.blendmode) : blend_node_t =
  let bottom = bottom#as_render_node in
  let top = top#as_render_node in
  let obj_ = Raw.Blend_node.new_ bottom top blend_mode in
  new blend_node obj_
