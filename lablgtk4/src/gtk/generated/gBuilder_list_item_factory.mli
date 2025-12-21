class builder_list_item_factory : Builder_list_item_factory.t ->
  object
    method get_resource : unit -> string option
    method as_builder_list_item_factory : Builder_list_item_factory.t
  end

