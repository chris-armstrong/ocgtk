class type bitset_iter_t = object
  method get_value : unit -> int
  method is_valid : unit -> bool
  method as_bitset_iter : Bitset_iter.t
end

(* High-level class for BitsetIter *)
class bitset_iter (obj : Bitset_iter.t) : bitset_iter_t =
  object (self)
    method get_value : unit -> int = fun () -> Bitset_iter.get_value obj
    method is_valid : unit -> bool = fun () -> Bitset_iter.is_valid obj
    method as_bitset_iter = obj
  end
