class bitset : Bitset.t ->
  object
    method add : int -> bool
    method add_range : int -> int -> unit
    method add_range_closed : int -> int -> unit
    method add_rectangle : int -> int -> int -> int -> unit
    method contains : int -> bool
    method copy : unit -> Bitset.t
    method difference : Bitset.t -> unit
    method equals : Bitset.t -> bool
    method get_maximum : unit -> int
    method get_minimum : unit -> int
    method get_nth : int -> int
    method intersect : Bitset.t -> unit
    method is_empty : unit -> bool
    method ref : unit -> Bitset.t
    method remove : int -> bool
    method remove_all : unit -> unit
    method remove_range : int -> int -> unit
    method remove_range_closed : int -> int -> unit
    method remove_rectangle : int -> int -> int -> int -> unit
    method shift_left : int -> unit
    method shift_right : int -> unit
    method splice : int -> int -> int -> unit
    method subtract : Bitset.t -> unit
    method union : Bitset.t -> unit
    method unref : unit -> unit
    method as_bitset : Bitset.t
  end

