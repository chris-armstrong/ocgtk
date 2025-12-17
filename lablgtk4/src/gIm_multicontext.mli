class im_multicontext : Im_multicontext.t ->
  object
    method get_context_id : unit -> string
    method set_context_id : string option -> unit
    method as_im_multicontext : Im_multicontext.t
  end

