class type multi_sorter_t = object
    method append : GSorter.sorter_t -> unit
    method remove : int -> unit
    method n_items : int
    method as_multi_sorter : Multi_sorter.t
end

(* High-level class for MultiSorter *)
class multi_sorter (obj : Multi_sorter.t) : multi_sorter_t = object (self)

  method append : GSorter.sorter_t -> unit =
    fun sorter ->
      let sorter = sorter#as_sorter in
      (Multi_sorter.append obj sorter)

  method remove : int -> unit =
    fun position ->
      (Multi_sorter.remove obj position)

  method n_items = Multi_sorter.get_n_items obj

    method as_multi_sorter = obj
end

