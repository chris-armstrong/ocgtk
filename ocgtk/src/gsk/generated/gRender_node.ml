class type render_node_t = object
    method draw : Ocgtk_cairo.Cairo.Context.context_t -> unit
    method get_node_type : unit -> Gsk_enums.rendernodetype
    method ref : unit -> render_node_t
    method unref : unit -> unit
    method write_to_file : string -> (bool, GError.t) result
    method as_render_node : Render_node.t
end

(* High-level class for RenderNode *)
class render_node (obj : Render_node.t) : render_node_t = object (self)

  method draw : Ocgtk_cairo.Cairo.Context.context_t -> unit =
    fun cr ->
      let cr = cr#as_context in
      (Render_node.draw obj cr)

  method get_node_type : unit -> Gsk_enums.rendernodetype =
    fun () ->
      (Render_node.get_node_type obj)

  method ref : unit -> render_node_t =
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

