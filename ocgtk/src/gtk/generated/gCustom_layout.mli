class type custom_layout_t = object
    method as_custom_layout : Custom_layout.t
end

class custom_layout : Custom_layout.t -> custom_layout_t

