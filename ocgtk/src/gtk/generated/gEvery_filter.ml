class type every_filter_t = object
    method as_every_filter : Every_filter.t
end

(* High-level class for EveryFilter *)
class every_filter (obj : Every_filter.t) : every_filter_t = object (self)

    method as_every_filter = obj
end

