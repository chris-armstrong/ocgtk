class type list_item_factory_t = object
    method as_list_item_factory : List_item_factory.t
end

(* High-level class for ListItemFactory *)
class list_item_factory (obj : List_item_factory.t) : list_item_factory_t = object (self)

    method as_list_item_factory = obj
end

