class type bin_layout_t = object
    method as_bin_layout : Bin_layout.t
end

(* High-level class for BinLayout *)
class bin_layout (obj : Bin_layout.t) : bin_layout_t = object (self)

    method as_bin_layout = obj
end

