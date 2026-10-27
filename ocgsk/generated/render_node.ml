class type render_node_t = object
  method draw : Occairo.Context.context_t -> unit
  method get_node_type : unit -> Enums.rendernodetype
  method ref : unit -> render_node_t
  method serialize : unit -> Glib_bytes.t
  method unref : unit -> unit
  method write_to_file : string -> (bool, GError.t) result
  method as_render_node : Raw.Render_node.t
end

(* High-level class for RenderNode *)
class render_node (obj : Raw.Render_node.t) : render_node_t =
  object (self)
    method draw : Occairo.Context.context_t -> unit =
      fun cr ->
        let cr = cr#as_context in
        Raw.Render_node.draw obj cr

    method get_node_type : unit -> Enums.rendernodetype =
      fun () -> Raw.Render_node.get_node_type obj

    method ref : unit -> render_node_t =
      fun () -> new render_node (Raw.Render_node.ref obj)

    method serialize : unit -> Glib_bytes.t =
      fun () -> Raw.Render_node.serialize obj

    method unref : unit -> unit = fun () -> Raw.Render_node.unref obj

    method write_to_file : string -> (bool, GError.t) result =
      fun filename -> Raw.Render_node.write_to_file obj filename

    method as_render_node = obj
  end
