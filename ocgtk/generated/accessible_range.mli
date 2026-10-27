class type accessible_range_t = object
  method as_accessible_range : Raw.Accessible_range.t
end

class accessible_range : Raw.Accessible_range.t -> accessible_range_t
