(* High-level class for MapListModel *)
class map_list_model (obj : Map_list_model.t) = object (self)

  method has_map = Map_list_model.get_has_map obj

  method n_items = Map_list_model.get_n_items obj

    method as_map_list_model = obj
end

