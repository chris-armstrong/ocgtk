(* High-level class for MultiSelection *)
class multi_selection (obj : Multi_selection.t) = object (self)

  method n_items = Multi_selection.get_n_items obj

    method as_multi_selection = obj
end

