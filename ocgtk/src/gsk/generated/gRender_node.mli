class render_node : Render_node.t ->
  object
    method draw : #Ocgtk_cairo.Cairo.context -> unit
    method get_node_type : unit -> Gsk_enums.rendernodetype
    method ref : unit -> render_node
    method unref : unit -> unit
    method write_to_file : string -> (bool, GError.t) result
    method as_render_node : Render_node.t
  end

