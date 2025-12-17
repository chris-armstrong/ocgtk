(* High-level class for MultiSorter *)
class multi_sorter (obj : Multi_sorter.t) = object (self)

  method append : 'p1. (#GSorter.sorter as 'p1) -> unit = fun sorter -> (Multi_sorter.append obj ( sorter#as_sorter ))

  method remove : int -> unit = fun position -> (Multi_sorter.remove obj position)

    method as_multi_sorter = obj
end

