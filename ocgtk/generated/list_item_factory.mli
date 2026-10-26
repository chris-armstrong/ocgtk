class type list_item_factory_t = object
  method as_list_item_factory : Raw.List_item_factory.t
end

class list_item_factory : Raw.List_item_factory.t -> list_item_factory_t
