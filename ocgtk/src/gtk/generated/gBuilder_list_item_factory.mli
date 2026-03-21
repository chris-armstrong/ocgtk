class type builder_list_item_factory_t = object
    method get_resource : unit -> string option
    method get_scope : unit -> GBuilder_scope.builder_scope_t option
    method as_builder_list_item_factory : Builder_list_item_factory.t
end

class builder_list_item_factory : Builder_list_item_factory.t -> builder_list_item_factory_t

