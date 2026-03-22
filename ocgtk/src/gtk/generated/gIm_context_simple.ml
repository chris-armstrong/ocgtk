class type im_context_simple_t = object
    inherit GIm_context.im_context_t
    method add_compose_file : string -> unit
    method as_im_context_simple : Im_context_simple.t
end

(* High-level class for IMContextSimple *)
class im_context_simple (obj : Im_context_simple.t) : im_context_simple_t = object (self)
  inherit GIm_context.im_context (Obj.magic obj : Im_context.t)

  method add_compose_file : string -> unit =
    fun compose_file ->
      (Im_context_simple.add_compose_file obj compose_file)

    method as_im_context_simple = obj
end

