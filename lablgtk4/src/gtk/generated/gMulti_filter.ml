(* High-level class for MultiFilter *)
class multi_filter (obj : Multi_filter.t) = object (self)

  method n_items = Multi_filter.get_n_items obj

  method append : 'p1. (#GFilter.filter as 'p1) -> unit = fun filter -> (Multi_filter.append obj ( filter#as_filter ))

  method remove : int -> unit = fun position -> (Multi_filter.remove obj position)

    method as_multi_filter = obj
end

