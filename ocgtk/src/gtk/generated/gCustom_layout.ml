class type custom_layout_t = object
    method as_custom_layout : Custom_layout.t
end

(* High-level class for CustomLayout *)
class custom_layout (obj : Custom_layout.t) : custom_layout_t = object (self)

    method as_custom_layout = obj
end

