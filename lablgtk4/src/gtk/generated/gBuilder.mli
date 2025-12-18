class builder : Builder.t ->
  object
    method translation_domain : string
    method set_translation_domain : string -> unit
    method add_from_file : string -> (bool, GError.t) result
    method add_from_resource : string -> (bool, GError.t) result
    method get_scope : unit -> GBuilder_scope.builder_scope
    method set_scope : GBuilder_scope.builder_scope option -> unit
    method as_builder : Builder.t
  end

