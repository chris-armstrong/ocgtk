class type multi_sorter_t = object
    inherit GSorter.sorter_t
    method append : GSorter.sorter_t -> unit
    method remove : int -> unit
    method item_type : int
    method n_items : int
    method as_multi_sorter : Multi_sorter.t
end

class multi_sorter : Multi_sorter.t -> multi_sorter_t

val new_ : unit -> multi_sorter_t
