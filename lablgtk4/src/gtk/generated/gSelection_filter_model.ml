(* High-level class for SelectionFilterModel *)
class selection_filter_model (obj : Selection_filter_model.t) = object (self)

  method n_items = Selection_filter_model.get_n_items obj

    method as_selection_filter_model = obj
end

