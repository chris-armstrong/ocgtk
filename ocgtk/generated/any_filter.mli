class type any_filter_t = object
  inherit Multi_filter.multi_filter_t
  method as_any_filter : Raw.Any_filter.t
end

class any_filter : Raw.Any_filter.t -> any_filter_t

val new_ : unit -> any_filter_t
