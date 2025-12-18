(* High-level class for FlattenListModel *)
class flatten_list_model (obj : Flatten_list_model.t) = object (self)

  method n_items = Flatten_list_model.get_n_items obj

    method as_flatten_list_model = obj
end

