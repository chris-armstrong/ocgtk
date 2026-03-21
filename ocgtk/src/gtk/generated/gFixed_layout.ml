class type fixed_layout_t = object
    method as_fixed_layout : Fixed_layout.t
end

(* High-level class for FixedLayout *)
class fixed_layout (obj : Fixed_layout.t) : fixed_layout_t = object (self)

    method as_fixed_layout = obj
end

