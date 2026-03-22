class type im_context_simple_t = object
    inherit GIm_context.im_context_t
    method add_compose_file : string -> unit
    method as_im_context_simple : Im_context_simple.t
end

class im_context_simple : Im_context_simple.t -> im_context_simple_t

