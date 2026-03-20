class type im_multicontext_t = object
    method get_context_id : unit -> string
    method set_context_id : string option -> unit
    method as_im_multicontext : Im_multicontext.t
end

(* High-level class for IMMulticontext *)
class im_multicontext (obj : Im_multicontext.t) : im_multicontext_t = object (self)

  method get_context_id : unit -> string =
    fun () ->
      (Im_multicontext.get_context_id obj)

  method set_context_id : string option -> unit =
    fun context_id ->
      (Im_multicontext.set_context_id obj context_id)

    method as_im_multicontext = obj
end

