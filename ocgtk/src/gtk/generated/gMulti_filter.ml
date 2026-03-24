class type multi_filter_t = object
    inherit GFilter.filter_t
    method append : GFilter.filter_t -> unit
    method remove : int -> unit
    method n_items : int
    method as_multi_filter : Multi_filter.t
end

(* High-level class for MultiFilter *)
class multi_filter (obj : Multi_filter.t) : multi_filter_t = object (self)
  inherit GFilter.filter (obj :> Filter.t)

  method append : GFilter.filter_t -> unit =
    fun filter ->
      let filter = filter#as_filter in
      (Multi_filter.append obj filter)

  method remove : int -> unit =
    fun position ->
      (Multi_filter.remove obj position)

  method n_items = Multi_filter.get_n_items obj

    method as_multi_filter = obj
end

