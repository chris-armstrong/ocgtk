(* High-level class for Builder *)
class builder (obj : Builder.t) = object (self)

  method add_from_resource : string -> (bool, GError.t) result =
    fun resource_path ->
      (Builder.add_from_resource obj resource_path)

  method get_translation_domain : unit -> string option =
    fun () ->
      (Builder.get_translation_domain obj)

  method set_translation_domain : string option -> unit =
    fun domain ->
      (Builder.set_translation_domain obj domain)

    method as_builder = obj
end

