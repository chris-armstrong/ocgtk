class type debug_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_message : unit -> string
    method as_debug_node : Debug_node.t
end

(* High-level class for DebugNode *)
class debug_node (obj : Debug_node.t) : debug_node_t = object (self)
  inherit GRender_node.render_node (Obj.magic obj : Render_node.t)

  method get_child : unit -> GRender_node.render_node_t =
    fun () ->
      new  GRender_node.render_node(Debug_node.get_child obj)

  method get_message : unit -> string =
    fun () ->
      (Debug_node.get_message obj)

    method as_debug_node = obj
end

let new_ (child : GRender_node.render_node_t) (message : string) : debug_node_t =
  let child = child#as_render_node in
  new debug_node (Debug_node.new_ child message)

