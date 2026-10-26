class type bitset_t = object
  method add : int -> bool
  method add_range : int -> int -> unit
  method add_range_closed : int -> int -> unit
  method add_rectangle : int -> int -> int -> int -> unit
  method contains : int -> bool
  method difference : Raw.Bitset.t -> unit
  method equals : Raw.Bitset.t -> bool
  method get_maximum : unit -> int
  method get_minimum : unit -> int
  method get_nth : int -> int
  method get_size : unit -> UInt64.t
  method get_size_in_range : int -> int -> UInt64.t
  method intersect : Raw.Bitset.t -> unit
  method is_empty : unit -> bool
  method ref : unit -> Raw.Bitset.t
  method remove : int -> bool
  method remove_all : unit -> unit
  method remove_range : int -> int -> unit
  method remove_range_closed : int -> int -> unit
  method remove_rectangle : int -> int -> int -> int -> unit
  method shift_left : int -> unit
  method shift_right : int -> unit
  method splice : int -> int -> int -> unit
  method subtract : Raw.Bitset.t -> unit
  method union : Raw.Bitset.t -> unit
  method as_bitset : Raw.Bitset.t
end

class bitset : Raw.Bitset.t -> bitset_t

val new_empty : unit -> bitset_t
val new_range : int -> int -> bitset_t
