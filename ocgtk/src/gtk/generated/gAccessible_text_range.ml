class type accessible_text_range_t = object
    method as_accessible_text_range : Accessible_text_range.t
end

(* High-level class for AccessibleTextRange *)
class accessible_text_range (obj : Accessible_text_range.t) : accessible_text_range_t = object (self)

    method as_accessible_text_range = obj
end

