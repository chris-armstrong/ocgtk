class type bitset_iter_t = object
  method get_value : unit -> int
  method is_valid : unit -> bool
  method as_bitset_iter : Raw.Bitset_iter.t
end

(* High-level class for BitsetIter *)
class bitset_iter (obj : Raw.Bitset_iter.t) : bitset_iter_t =
  object (self)
    method get_value : unit -> int = fun () -> Raw.Bitset_iter.get_value obj
    method is_valid : unit -> bool = fun () -> Raw.Bitset_iter.is_valid obj
    method as_bitset_iter = obj
  end
