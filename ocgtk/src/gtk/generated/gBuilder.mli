class builder : Builder.t ->
  object
    method add_from_file : string -> (bool, GError.t) result
    method add_from_resource : string -> (bool, GError.t) result
    method get_scope : unit -> GBuilder_scope.builder_scope
    method get_translation_domain : unit -> string option
    method set_translation_domain : string option -> unit
    method as_builder : Builder.t
  end

