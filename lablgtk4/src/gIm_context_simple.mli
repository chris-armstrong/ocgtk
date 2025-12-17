class im_context_simple : Im_context_simple.t ->
  object
    method add_compose_file : string -> unit
    method as_im_context_simple : Im_context_simple.t
  end

