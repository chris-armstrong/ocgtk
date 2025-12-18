(* High-level class for SingleSelection *)
class single_selection (obj : Single_selection.t) = object (self)

  method autoselect = Single_selection.get_autoselect obj
  method set_autoselect v = Single_selection.set_autoselect obj v

  method can_unselect = Single_selection.get_can_unselect obj
  method set_can_unselect v = Single_selection.set_can_unselect obj v

  method n_items = Single_selection.get_n_items obj

  method selected = Single_selection.get_selected obj
  method set_selected v = Single_selection.set_selected obj v

    method as_single_selection = obj
end

