class type render_node_t = object
  method draw : Occairo.Context.context_t -> unit
  method get_node_type : unit -> Enums.rendernodetype
  method ref : unit -> render_node_t
  method serialize : unit -> Glib_bytes.t
  method unref : unit -> unit
  method write_to_file : string -> (bool, GError.t) result
  method as_render_node : Raw.Render_node.t
end

class render_node : Raw.Render_node.t -> render_node_t
