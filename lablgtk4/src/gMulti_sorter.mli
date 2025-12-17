class multi_sorter : Multi_sorter.t ->
  object
    method append : #GSorter.sorter -> unit
    method remove : int -> unit
    method as_multi_sorter : Multi_sorter.t
  end

