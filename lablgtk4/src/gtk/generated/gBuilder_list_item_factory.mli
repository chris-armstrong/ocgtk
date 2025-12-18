class builder_list_item_factory : Builder_list_item_factory.t ->
  object
    method resource : string
    method get_scope : unit -> GBuilder_scope.builder_scope option
    method as_builder_list_item_factory : Builder_list_item_factory.t
  end

