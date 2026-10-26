class type bitset_iter_t = object
  method get_value : unit -> int
  method is_valid : unit -> bool
  method as_bitset_iter : Raw.Bitset_iter.t
end

class bitset_iter : Raw.Bitset_iter.t -> bitset_iter_t
