class type accessible_list_t = object
    method as_accessible_list : Accessible_list.t
end

class accessible_list : Accessible_list.t -> accessible_list_t

