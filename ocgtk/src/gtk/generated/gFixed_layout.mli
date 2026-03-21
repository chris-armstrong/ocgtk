class type fixed_layout_t = object
    method as_fixed_layout : Fixed_layout.t
end

class fixed_layout : Fixed_layout.t -> fixed_layout_t

