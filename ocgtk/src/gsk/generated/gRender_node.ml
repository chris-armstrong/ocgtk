(* High-level class for RenderNode *)
class render_node (obj : Render_node.t) = object (self)

  method get_node_type : unit -> Gsk_enums.rendernodetype =
    fun () ->
      (Render_node.get_node_type obj)

  method ref : unit -> render_node =
    fun () ->
      new  render_node(Render_node.ref obj)

  method unref : unit -> unit =
    fun () ->
      (Render_node.unref obj)

  method write_to_file : string -> (bool, GError.t) result =
    fun filename ->
      (Render_node.write_to_file obj filename)

    method as_render_node = obj
end

