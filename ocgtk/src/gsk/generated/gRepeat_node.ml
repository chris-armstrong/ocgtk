(* High-level class for RepeatNode *)
class repeat_node (obj : Repeat_node.t) = object (self)

  method get_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Repeat_node.get_child obj)

    method as_repeat_node = obj
end

