class type any_filter_t = object
    method as_any_filter : Any_filter.t
end

(* High-level class for AnyFilter *)
class any_filter (obj : Any_filter.t) : any_filter_t = object (self)

    method as_any_filter = obj
end

