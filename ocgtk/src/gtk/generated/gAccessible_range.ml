class type accessible_range_t = object
    method as_accessible_range : Accessible_range.t
end

(* High-level class for AccessibleRange *)
class accessible_range (obj : Accessible_range.t) : accessible_range_t = object (self)

    method as_accessible_range = obj
end

