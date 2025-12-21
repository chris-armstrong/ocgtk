(* High-level class for BitsetIter *)
class bitset_iter (obj : Bitset_iter.t) = object (self)

  method get_value : unit -> int =
    fun () ->
      (Bitset_iter.get_value obj)

  method is_valid : unit -> bool =
    fun () ->
      (Bitset_iter.is_valid obj)

    method as_bitset_iter = obj
end

