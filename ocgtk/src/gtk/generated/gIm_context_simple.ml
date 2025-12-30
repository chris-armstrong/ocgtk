(* High-level class for IMContextSimple *)
class im_context_simple (obj : Im_context_simple.t) = object (self)

  method add_compose_file : string -> unit =
    fun compose_file ->
      (Im_context_simple.add_compose_file obj compose_file)

    method as_im_context_simple = obj
end

