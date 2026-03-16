(* High-level class for DebugNode *)
class debug_node (obj : Debug_node.t) = object (self)

  method get_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Debug_node.get_child obj)

  method get_message : unit -> string =
    fun () ->
      (Debug_node.get_message obj)

    method as_debug_node = obj
end

