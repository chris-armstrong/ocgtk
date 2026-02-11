(* High-level class for CrossFadeNode *)
class cross_fade_node (obj : Cross_fade_node.t) = object (self)

  method get_end_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Cross_fade_node.get_end_child obj)

  method get_progress : unit -> float =
    fun () ->
      (Cross_fade_node.get_progress obj)

  method get_start_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Cross_fade_node.get_start_child obj)

    method as_cross_fade_node = obj
end

