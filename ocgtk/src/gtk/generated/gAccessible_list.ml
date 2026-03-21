class type accessible_list_t = object
    method as_accessible_list : Accessible_list.t
end

(* High-level class for AccessibleList *)
class accessible_list (obj : Accessible_list.t) : accessible_list_t = object (self)

    method as_accessible_list = obj
end

