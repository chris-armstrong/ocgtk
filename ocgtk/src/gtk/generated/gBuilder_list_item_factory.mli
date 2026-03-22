class type builder_list_item_factory_t = object
    inherit GList_item_factory.list_item_factory_t
    method get_resource : unit -> string option
    method get_scope : unit -> GBuilder_scope.builder_scope_t option
    method as_builder_list_item_factory : Builder_list_item_factory.t
end

class builder_list_item_factory : Builder_list_item_factory.t -> builder_list_item_factory_t

