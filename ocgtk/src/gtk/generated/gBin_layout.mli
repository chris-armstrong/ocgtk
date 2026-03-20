class type bin_layout_t = object
    method as_bin_layout : Bin_layout.t
end

class bin_layout : Bin_layout.t -> bin_layout_t

