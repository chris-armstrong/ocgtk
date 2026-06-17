class type im_multicontext_t = object
  inherit GIm_context.im_context_t
  method get_context_id : unit -> string
  method set_context_id : string option -> unit
  method as_im_multicontext : Im_multicontext.t
end

class im_multicontext : Im_multicontext.t -> im_multicontext_t

val new_ : unit -> im_multicontext_t
