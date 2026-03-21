class type multi_filter_t = object
    method append : GFilter.filter_t -> unit
    method remove : int -> unit
    method n_items : int
    method as_multi_filter : Multi_filter.t
end

class multi_filter : Multi_filter.t -> multi_filter_t

