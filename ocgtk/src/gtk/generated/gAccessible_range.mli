class type accessible_range_t = object
  method as_accessible_range : Accessible_range.t
end

class accessible_range : Accessible_range.t -> accessible_range_t
