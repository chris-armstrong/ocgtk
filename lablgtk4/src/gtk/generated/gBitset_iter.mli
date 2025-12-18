class bitset_iter : Bitset_iter.t ->
  object
    method get_value : unit -> int
    method is_valid : unit -> bool
    method as_bitset_iter : Bitset_iter.t
  end

