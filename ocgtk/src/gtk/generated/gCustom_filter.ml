class type custom_filter_t = object
  inherit GFilter.filter_t
  method as_custom_filter : Custom_filter.t
end

(* High-level class for CustomFilter *)
class custom_filter (obj : Custom_filter.t) : custom_filter_t =
  object (self)
    inherit GFilter.filter (obj :> Filter.t)
    method as_custom_filter = obj
  end
