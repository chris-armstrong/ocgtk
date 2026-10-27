class type im_context_simple_t = object
  inherit Im_context.im_context_t
  method add_compose_file : string -> unit
  method as_im_context_simple : Raw.Im_context_simple.t
end

(* High-level class for IMContextSimple *)
class im_context_simple (obj : Raw.Im_context_simple.t) : im_context_simple_t =
  object (self)
    inherit Im_context.im_context (obj :> Raw.Im_context.t)

    method add_compose_file : string -> unit =
      fun compose_file ->
        Raw.Im_context_simple.add_compose_file obj compose_file

    method as_im_context_simple = obj
  end

let new_ () : im_context_simple_t =
  new im_context_simple (Raw.Im_context_simple.new_ ())
