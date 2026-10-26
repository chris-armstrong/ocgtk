class type accessible_text_range_t = object
  method as_accessible_text_range : Accessible_text_range.t
end

class accessible_text_range : Accessible_text_range.t -> accessible_text_range_t
