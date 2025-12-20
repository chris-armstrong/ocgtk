(* High-level class for MultiFilter *)
class multi_filter (obj : Multi_filter.t) = object (self)

  method append : 'p1. (#GFilter.filter as 'p1) -> unit =
    fun filter ->
      let filter = filter#as_filter in
      (Multi_filter.append obj filter)

  method remove : int -> unit =
    fun position ->
      (Multi_filter.remove obj position)

  method n_items = Multi_filter.get_n_items obj

    method as_multi_filter = obj
end

