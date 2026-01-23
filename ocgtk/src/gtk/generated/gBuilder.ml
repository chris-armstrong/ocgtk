(* High-level class for Builder *)
class builder (obj : Builder.t) = object (self)

  method add_from_file : string -> (bool, GError.t) result =
    fun filename ->
      (Builder.add_from_file obj filename)

  method add_from_resource : string -> (bool, GError.t) result =
    fun resource_path ->
      (Builder.add_from_resource obj resource_path)

  method add_objects_from_file : string -> string array -> (bool, GError.t) result =
    fun filename object_ids ->
      (Builder.add_objects_from_file obj filename object_ids)

  method add_objects_from_resource : string -> string array -> (bool, GError.t) result =
    fun resource_path object_ids ->
      (Builder.add_objects_from_resource obj resource_path object_ids)

  method get_scope : unit -> GBuilder_scope.builder_scope =
    fun () ->
      new  GBuilder_scope.builder_scope(Builder.get_scope obj)

  method get_translation_domain : unit -> string option =
    fun () ->
      (Builder.get_translation_domain obj)

  method set_translation_domain : string option -> unit =
    fun domain ->
      (Builder.set_translation_domain obj domain)

    method as_builder = obj
end

