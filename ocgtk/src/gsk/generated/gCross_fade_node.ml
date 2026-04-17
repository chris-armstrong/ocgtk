class type cross_fade_node_t = object
    inherit GRender_node.render_node_t
    method get_end_child : unit -> GRender_node.render_node_t
    method get_progress : unit -> float
    method get_start_child : unit -> GRender_node.render_node_t
    method as_cross_fade_node : Cross_fade_node.t
end

(* High-level class for CrossFadeNode *)
class cross_fade_node (obj : Cross_fade_node.t) : cross_fade_node_t = object (self)
  inherit GRender_node.render_node (obj :> Render_node.t)

  method get_end_child : unit -> GRender_node.render_node_t =
    fun () ->
      new  GRender_node.render_node(Cross_fade_node.get_end_child obj)

  method get_progress : unit -> float =
    fun () ->
      (Cross_fade_node.get_progress obj)

  method get_start_child : unit -> GRender_node.render_node_t =
    fun () ->
      new  GRender_node.render_node(Cross_fade_node.get_start_child obj)

    method as_cross_fade_node = obj
end

let new_ (start : GRender_node.render_node_t) (end_ : GRender_node.render_node_t) (progress : float) : cross_fade_node_t =
  let start = start#as_render_node in
  let end_ = end_#as_render_node in
  let obj_ = Cross_fade_node.new_ start end_ progress in
  new cross_fade_node obj_

