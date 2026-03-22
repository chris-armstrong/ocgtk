class type any_filter_t = object
    inherit GMulti_filter.multi_filter_t
    method as_any_filter : Any_filter.t
end

(* High-level class for AnyFilter *)
class any_filter (obj : Any_filter.t) : any_filter_t = object (self)
  inherit GMulti_filter.multi_filter (Obj.magic obj : Multi_filter.t)

    method as_any_filter = obj
end

