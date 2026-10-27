class type every_filter_t = object
  inherit Multi_filter.multi_filter_t
  method as_every_filter : Raw.Every_filter.t
end

class every_filter : Raw.Every_filter.t -> every_filter_t

val new_ : unit -> every_filter_t
