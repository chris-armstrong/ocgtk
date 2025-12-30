(* High-level class for NoSelection *)
class no_selection (obj : No_selection.t) = object (self)

  method n_items = No_selection.get_n_items obj

    method as_no_selection = obj
end

